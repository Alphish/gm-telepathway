/// @function __Editor_onTest()

var _player_count = 0;
for (var i = 0 ; i < ctrl_EditorGrid.grid_width; i++)
for (var j = 0 ; j < ctrl_EditorGrid.grid_height; j++) {
	if (ctrl_EditorGrid.enemies[# i, j] == EnemyUnit.Player)
		_player_count++;
}

if (_player_count != 1) {
	show_message("There must be exactly one player on the field.");
	exit;
}

global.is_test = true;
global.level_index = -1;
global.level_info = __Editor_createLevelInfo();

room_goto(rm_Ingame);
