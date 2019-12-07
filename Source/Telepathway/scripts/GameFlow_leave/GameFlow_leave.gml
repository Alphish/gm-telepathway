/// @function GameFlow_leave()

if (global.is_test) {
	room_goto(rm_Editor);
}
else {
	ds_map_destroy(global.level_info);
	room_goto(rm_LevelSelect);
}
