/// @function __EnemyAI_floodfill(grid,reachType,allowDiagonal)
/// @param {gridId} grid
/// @param {AttackReach} reachType
/// @param {bool} includeDiagonal

var _grid = argument0;
var _reach_type = argument1;
var _allow_diagonal = argument2;

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

var _dir_increment = _allow_diagonal ? 1 : 2;

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
			_grid[# _fx, _fy] = 100 * _step;
		
		for (var i = 0; i < 8; i += _dir_increment) {
			var _xoffset = global.DIR8X[i];
			var _yoffset = global.DIR8Y[i];
			
			var _spread = 1;
			while (true) {
				var _fxoff = _fx + _spread * _xoffset;
				var _fyoff = _fy + _spread * _yoffset;
				
				_spread++;

				var _fid = _fxoff + width * _fyoff;
				if (ds_map_exists(_visited_fields, _fid))
					continue;
			
				if (GameGrid_getFieldType(_fxoff, _fyoff) != FieldType.Floor)
					break;
			
				ds_list_add(_next_fields, _fid);
				ds_map_add(_visited_fields, _fid, true);
			}
		}
	}
	_step++;
}

_grid[# ctrl_GameGrid.player_x, ctrl_GameGrid.player_y] = undefined;

ds_map_destroy(_visited_fields);
ds_list_destroy(_next_fields);
ds_list_destroy(_current_fields);