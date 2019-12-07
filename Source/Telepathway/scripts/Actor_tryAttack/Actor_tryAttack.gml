/// @function Actor_tryAttack()

if (string_char_at(remaining_path, 1) != "!")
	exit;

var _attack_direction = real(string_char_at(remaining_path, 2));
var _attack_distance = real(string_delete(remaining_path, 1, 2));
remaining_path = "";
performs_attack = true;
attack_direction = _attack_direction;
attack_distance = _attack_distance;

var _xoffset = global.DIR8X[_attack_direction];
var _yoffset = global.DIR8Y[_attack_direction];

var _is_splash = unit == EnemyUnit.Grenadier;
var _target_x = fx + _xoffset * _attack_distance;
var _target_y = fy + _yoffset * _attack_distance;

GameGrid_knockOut(_target_x, _target_y);

if (_is_splash) {
	for (var i = 0; i < 8; i++) {
		var _splash_x = _target_x + global.DIR8X[i];
		var _splash_y = _target_y + global.DIR8Y[i];
		
		var _target_unit = GameGrid_getEnemyUnit(_splash_x, _splash_y);
		
		if (__PlayerControl_canDamageEnemy(unit, _target_unit, false, true))
			GameGrid_knockOut(_splash_x, _splash_y);
	}
}
