/// @function __PlayerControl_populateAttackDecisions()

var _is_preview = selected_ability == PlayerAbility.AttackPreview;

var _source_x = _is_preview ? selected_x : target_x;
var _source_y = _is_preview ? selected_y : target_y;

if (!_is_preview)
	decision_grid[# _source_x, _source_y] = DecisionType.Move;

var _enemy_unit = GameGrid_getEnemyUnit(selected_x, selected_y);
var _attack_type = Data_getEnemyUnitProperty(_enemy_unit, EnemyUnitProperty.Attack);

var _range;
switch (_attack_type) {
	case AttackReach.BasicStrike:
		_range = 1;
		break;
	case AttackReach.DroneStrike:
	case AttackReach.GrenadeStrike:
		_range = 2;
		break;
	case AttackReach.GunStrike:
		_range = 4;
		break;
	case AttackReach.LineStrike:
		_range = 9999;
		break;
	default:
		exit;
}
var _direction_step = _attack_type == AttackReach.LineStrike ? 2 : 1;
var _is_splash = _attack_type == AttackReach.GrenadeStrike;

for (var i = 0; i < 8; i += _direction_step) {
	var _xoffset = global.DIR8X[i];
	var _yoffset = global.DIR8Y[i];
	
	for (var j = 1; j <= _range; j++) {
		var _x = _source_x + j * _xoffset;
		var _y = _source_y + j * _yoffset;
	
		var _field_type = GameGrid_getFieldType(_x, _y);
		if (_field_type == FieldType.Wall)
			break;
		
		// simple preview stuff
		if (_is_preview) {
			decision_grid[# _x, _y] = DecisionType.AttackPreview;
			if (_is_splash) {
				for (var k = 0; k < 8; k++) {
					var _xsplash = _x + global.DIR8X[k];
					var _ysplash = _y + global.DIR8Y[k];
					if (decision_grid[# _xsplash, _ysplash] == DecisionType.None)
						decision_grid[# _xsplash, _ysplash] = DecisionType.GrenadePreview;
				}
			}
			continue;
		}
		
		// actually checking if there are valid targets around
		var _target_unit = GameGrid_getEnemyUnit(_x, _y);
		if (_target_unit == EnemyUnit.Player)
			break;
		
		if (selected_x == _x && selected_y == _y)
			_target_unit = EnemyUnit.None;
		
		var _is_hit = false;
		_is_hit |= (_x != selected_x || _y != selected_y) && __PlayerControl_canDamageEnemy(_enemy_unit, _target_unit, true, false);
		if (_is_splash) {
			var _is_player_collateral = false;
			for (var k = 0; k < 8; k++) {
				var _xsplash = _x + global.DIR8X[k];
				var _ysplash = _y + global.DIR8Y[k];
				var _splash_unit = GameGrid_getEnemyUnit(_xsplash, _ysplash);
				if (_splash_unit == EnemyUnit.Player) {
					_is_player_collateral = true;
					break
				}
				
				_is_hit |= __PlayerControl_canDamageEnemy(_enemy_unit, _splash_unit, false, false);
			}
			
			if (_is_player_collateral) {
				decision_grid[# _x, _y] = DecisionType.Miss;
				for (var k = 0; k < 8; k++) {
					var _xsplash = _x + global.DIR8X[k];
					var _ysplash = _y + global.DIR8Y[k];
					if (GameGrid_getFieldType(_xsplash, _ysplash) == FieldType.Wall)
						continue;
					else if (decision_grid[# _xsplash, _ysplash] == DecisionType.None)
						decision_grid[# _xsplash, _ysplash] = DecisionType.GrenadeMiss;
				}
				continue;
			}
		}
		
		decision_grid[# _x, _y] = _is_hit ? DecisionType.Hit : DecisionType.Miss;
		if (_is_splash) {
			for (var k = 0; k < 8; k++) {
				var _xsplash = _x + global.DIR8X[k];
				var _ysplash = _y + global.DIR8Y[k];
				var _splash_unit = GameGrid_getEnemyUnit(_xsplash, _ysplash);
				var _splash_type = _is_hit && __PlayerControl_canDamageEnemy(_enemy_unit, _splash_unit, false, false) ? DecisionType.GrenadeHit : DecisionType.GrenadeMiss;
				
				if (GameGrid_getFieldType(_xsplash, _ysplash) == FieldType.Wall)
					continue;
				else if (decision_grid[# _xsplash, _ysplash] == DecisionType.None || decision_grid[# _xsplash, _ysplash] == DecisionType.GrenadeMiss)
					decision_grid[# _xsplash, _ysplash] = _splash_type;
			}
		}
		
		if (_target_unit != EnemyUnit.None)
			break;
	}
}
