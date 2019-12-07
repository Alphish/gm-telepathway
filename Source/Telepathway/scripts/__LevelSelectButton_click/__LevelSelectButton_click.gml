/// @function __LevelSelectButton_click()

if (level_index > SaveState_getCompletion())
	exit;

global.is_test = false;
global.level_index = level_index;
global.level_info = json_load("levels\\" + level_path);

room_goto(rm_Ingame);
