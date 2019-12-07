/// @function GameGrid_create(levelInfo)
/// @param {map} levelInfo

with (new(ctrl_GameGrid)) {
	var _level_info = argument0;
	
	width = _level_info[? "width"];
	height = _level_info[? "height"];
	
	description = ds_map_exists(_level_info, "description") ? _level_info[? "description"] : "";

	terrain = ds_grid_create(width, height);
	ds_grid_clear(terrain, FieldType.Floor);

	var _terrain_str = _level_info[? "terrain"];
	var _fid = 0;
	for (var i = 1; i <= string_length(_terrain_str); i++) {
		var c = string_char_at(_terrain_str, i);
		switch (c) {
			case ".":
				terrain[# _fid mod width, _fid div width] = FieldType.Floor;
				_fid++;
				break;
			case "0":
				terrain[# _fid mod width, _fid div width] = FieldType.Gap;
				_fid++;
				break;
			case "#":
				terrain[# _fid mod width, _fid div width] = FieldType.Wall;
				_fid++;
				break;
		}
	}

	enemies = ds_grid_create(width, height);
	ds_grid_clear(enemies, EnemyUnit.None);

	actors = ds_grid_create(width, height);
	ds_grid_clear(actors, noone);

	actors_info = _level_info[? "actors"];
	for (var i = 0; i < ds_list_size(actors_info); i++) {
		GameGrid_addUnit(i);
	}
	
	field_size = 32;
	
	x = room_width div 2 - width * field_size div 2;
	y = room_height div 2 - width * field_size div 2;
}
