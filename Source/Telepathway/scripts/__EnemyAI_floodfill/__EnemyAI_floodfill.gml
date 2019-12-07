/// @function __EnemyAI_floodfill(grid,reachType,speed,skipGaps)
/// @param {gridId} grid
/// @param {AttackReach} reachType
/// @param {real} speed
/// @param {bool} skipGaps

var _grid = argument0;
var _reach_type = argument1;
var _speed = argument2;
var _skip_gaps = argument3;

ds_grid_clear(_grid, undefined);

var _visited_fields = ds_map_create();
var _next_fields = ds_list_create();

for (var i = 0; i < width; i++)
for (var j = 0; j < height; j++) {
	if ((attack_reach[# i, j] & _reach_type) > 0) {
		var _fid = i + width * j;
		ds_list_add(_next_fields, _fid);
		ds_map_add(_visited_fields, _fid, true);
	}
}

var _step = 0;
var _current_fields = ds_list_create();
while (!ds_list_empty(_next_fields)) {
	ds_list_copy(_current_fields, _next_fields);
	ds_list_clear(_next_fields);
	
	while (!ds_list_empty(_current_fields)) {
		var _field = _current_fields[| 0];
		var _fx = _field mod width;
		var _fy = _field div width;
		ds_list_delete(_current_fields, 0);
		
		if (GameGrid_getFieldType(_fx, _fy) == FieldType.Floor)
			_grid[# _fx, _fy] = 100 * ceil(_step / _speed) + (_step mod _speed == 0 ? _speed : _step mod _speed);
		
		for (var i = 0; i < 4; i++) {
			var _xoffset = global.DIR4X[i];
			var _yoffset = global.DIR4Y[i];
			
			var _fxoff = _fx + _xoffset;
			var _fyoff = _fy + _yoffset;
			var _fid = _fxoff + width * _fyoff;
			if (ds_map_exists(_visited_fields, _fid))
				continue;
			
			var _field_type = GameGrid_getFieldType(_fxoff, _fyoff);
			
			if (_field_type == FieldType.Wall)
				continue;
			if (_field_type == FieldType.Gap && !_skip_gaps)
				continue;
			//if (_field_type == FieldType.Gap && (_step+1) mod _speed == 0)
			//	continue;
			// if (GameState_isDisabled(_fxoff, _fyoff))	// a disabled enemy can be treated as a wall essentially
			//	continue;
			
			ds_list_add(_next_fields, _fid);
			ds_map_add(_visited_fields, _fid, true);
		}
	}
	_step++;
}

_grid[# ctrl_GameGrid.player_x, ctrl_GameGrid.player_y] = undefined;

ds_map_destroy(_visited_fields);
ds_list_destroy(_next_fields);
ds_list_destroy(_current_fields);
