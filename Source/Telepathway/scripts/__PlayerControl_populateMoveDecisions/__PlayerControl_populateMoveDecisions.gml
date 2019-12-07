/// @function __PlayerControl_populateMoveDecisions()

var _x = selected_x;
var _y = selected_y;

var _enemy_unit = GameGrid_getEnemyUnit(_x, _y);
var _speed = Data_getEnemyUnitProperty(_enemy_unit, EnemyUnitProperty.Speed);
var _skip_gaps = Data_getEnemyUnitProperty(_enemy_unit, EnemyUnitProperty.Hover);

var _regular_decision, _interference_decision;
if (selected_ability == PlayerAbility.MovePreview) {
	_regular_decision = DecisionType.MovePreview;
	_interference_decision = DecisionType.MovePreview;
}
else {
	if (selected_interference) {
		_regular_decision = max_psi < 2 ? DecisionType.MovePsi : DecisionType.MoveAttackPsi;
		_interference_decision = max_psi < 2 ? DecisionType.MovePsi : DecisionType.MoveAttackPsi;
	}
	else {
		switch (max_psi) {
			case 3:
				_regular_decision = DecisionType.MoveAttack;
				_interference_decision = DecisionType.MoveAttackPsi;
				break;
			case 2:
				_regular_decision = DecisionType.MoveAttack;
				_interference_decision = DecisionType.MovePsi;
				break;
			default:
				_regular_decision = DecisionType.Move;
				_interference_decision = DecisionType.MovePsiUnavailable;
				break;
		}
	}
}

var _visited_fields = ds_map_create();
var _next_fields = ds_list_create();

var _fid = _x + width * _y;
ds_list_add(_next_fields, [_fid, ""]);
ds_map_add(_visited_fields, _fid, true);

var _step = _speed;
var _current_fields = ds_list_create();
while (_step >= 0 && !ds_list_empty(_next_fields)) {
	ds_list_copy(_current_fields, _next_fields);
	ds_list_clear(_next_fields);
	
	while (!ds_list_empty(_current_fields)) {
		var _data = _current_fields[| 0]
		var _field = _data[0];
		var _fx = _field mod width;
		var _fy = _field div width;
		var _path = _data[1];
		ds_list_delete(_current_fields, 0);
		
		var _field_type = GameGrid_getFieldType(_fx, _fy);
		if (_field_type == FieldType.Floor) {
			decision_grid[# _fx, _fy] = psi_interference[# _fx, _fy] ? _interference_decision : _regular_decision;
			movement_path[# _fx, _fy] = _path;
		}
		else {
			decision_grid[# _fx, _fy] = DecisionType.Gap;
		}
		
		for (var i = 0; i < 4; i++) {
			var _xoffset = global.DIR4X[i];
			var _yoffset = global.DIR4Y[i];
			
			var _fxoff = _fx + _xoffset;
			var _fyoff = _fy + _yoffset;
			var _fid = _fxoff + width * _fyoff;
			if (ds_map_exists(_visited_fields, _fid))
				continue;
				
			if (GameGrid_getEnemyUnit(_fxoff, _fyoff) != EnemyUnit.None)
				continue;
			
			var _field_type = GameGrid_getFieldType(_fxoff, _fyoff);
			
			if (_field_type == FieldType.Wall)
				continue;
			if (_field_type == FieldType.Gap && !_skip_gaps)
				continue;
			if (_field_type == FieldType.Gap && _step == 0)
				continue;
			
			ds_list_add(_next_fields, [_fid, _path + string(2*i)]);
			ds_map_add(_visited_fields, _fid, true);
		}
	}
	_step--;
}

ds_map_destroy(_visited_fields);
ds_list_destroy(_next_fields);
ds_list_destroy(_current_fields);
