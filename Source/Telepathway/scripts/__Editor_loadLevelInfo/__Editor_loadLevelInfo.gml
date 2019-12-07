/// @function __Editor_loadLevelInfo(levelInfo)
/// @param {map} levelInfo

var _level_info = argument0;

with (ctrl_EditorGrid) {
	ds_grid_clear(terrain, FieldType.Floor);
	ds_grid_clear(enemies, EnemyUnit.None);
	
	__EditorGrid_resize(_level_info[? "width"], _level_info[? "height"]);
	
	var _terrain_str = _level_info[? "terrain"];
	var _fid = 0;
	for (var i = 1; i <= string_length(_terrain_str); i++) {
		var c = string_char_at(_terrain_str, i);
		switch (c) {
			case ".":
				terrain[# _fid mod grid_width, _fid div grid_width] = FieldType.Floor;
				_fid++;
				break;
			case "0":
				terrain[# _fid mod grid_width, _fid div grid_width] = FieldType.Gap;
				_fid++;
				break;
			case "#":
				terrain[# _fid mod grid_width, _fid div grid_width] = FieldType.Wall;
				_fid++;
				break;
		}
	}
	
	var _actors_info = _level_info[? "actors"];
	for (var i = 0; i < ds_list_size(_actors_info); i++) {
		var _actor_info = _actors_info[| i];
		var _x = _actor_info[? "x"];
		var _y = _actor_info[? "y"];
		var _type = _actor_info[? "type"];
		var _unit_info = UnitInfo_fromType(_type);
		enemies[# _x, _y] = _unit_info[0];
	}
}