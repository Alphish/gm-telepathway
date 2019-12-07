/// @function SaveState_load()

ctrl_SaveState.data = json_load(SAVESTATE_PATH);
if (ctrl_SaveState.data == undefined) {
	file_delete(SAVESTATE_PATH);						// removing the player-saved savestate file
	ctrl_SaveState.data = json_load(SAVESTATE_PATH);	// loading the default version of the savestate file
}

// normalize the values
if (!is_real(ctrl_SaveState.data[? SAVESTATE_COMPLETION_VARIABLE]))
	ctrl_SaveState.data[? SAVESTATE_COMPLETION_VARIABLE] = 0;

SaveState_save();
