// __EnemyAI_processWalk(x,y)

var _x = argument0;
var _y = argument1;

var _enemy_unit = GameGrid_getEnemyUnit(_x, _y);
var _speed = Data_getEnemyUnitProperty(_enemy_unit, EnemyUnitProperty.Speed);
var _skip_gaps = Data_getEnemyUnitProperty(_enemy_unit, EnemyUnitProperty.Hover);
var _attack = Data_getEnemyUnitProperty(_enemy_unit, EnemyUnitProperty.Attack);

var _visited_fields = ds_map_create();
var _next_fields = ds_list_create();

var _fid = _x + width * _y;
ds_list_add(_next_fields, [_fid, ""]);
ds_map_add(_visited_fields, _fid, true);

var _current_priority = __EnemyAI_calculatePriority(_x, _y, "");
var _current_target_x = _x;
var _current_target_y = _y;
var _current_path = "";
var _is_safe = !dangers[# _x, _y];

if (is_undefined(_current_priority))
	exit;

var _grid = __EnemyAI_getEnemyUnitGrid(_enemy_unit);

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
		
		if (GameGrid_getFieldType(_fx, _fy) == FieldType.Floor) {

			var _priority = __EnemyAI_calculatePriority(_x, _y, _path);

			if (!is_undefined(_priority) && _priority < _current_priority &&
				(!_is_safe || !dangers[# _fx, _fy] || _grid[# _fx, _fy] < 100)) {
				_current_priority = _priority;
				_current_target_x = _fx;
				_current_target_y = _fy;
				_current_path = _path;
			}
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

var _has_attack = (attack_reach[# _current_target_x, _current_target_y] & _attack) > 0;
if (_has_attack) {
	if ((attack_reach[# _current_target_x, _current_target_y] & AttackReach.IsDirect) > 0)
		_current_path += GameGrid_prepareAttack(_current_target_x, _current_target_y, ctrl_GameGrid.player_x, ctrl_GameGrid.player_y);
	else
		_current_path += GameGrid_prepareThrow(_current_target_x, _current_target_y, ctrl_GameGrid.player_x, ctrl_GameGrid.player_y);
}

ds_list_add(walkers_schedule, [_x, _y, _current_path]);
GameGrid_moveEnemyUnit(_x, _y, _current_target_x, _current_target_y);

GameRecord_addEnemyMove(_x, _y, _current_path);
return string_pos("!", _current_path) > 0;
