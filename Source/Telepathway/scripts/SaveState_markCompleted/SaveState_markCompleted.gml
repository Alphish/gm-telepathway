/// @function SaveState_markCompleted(levelId)
/// @param {real} levelId

var _level_id = argument0;

var _level_completion = _level_id+1;
ctrl_SaveState.data[? SAVESTATE_COMPLETION_VARIABLE] = max(SaveState_getCompletion(), _level_completion);
SaveState_save();
