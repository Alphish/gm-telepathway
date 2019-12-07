/// @function GameRecord_undoTurn()

if (ctrl_GameRecord.current_turn == "") {
	var _previous_turns = ctrl_GameRecord.previous_turns;
	if (ds_list_empty(_previous_turns))
		exit;

	var _last_index = ds_list_size(_previous_turns) - 1;
	ctrl_GameRecord.current_turn = ds_list_find_value(_previous_turns, _last_index);
	ds_list_delete(_previous_turns, _last_index);
}

//show_debug_message(["Undoing", ctrl_GameRecord.current_turn]);

var _undo_actions = ds_stack_create();
while (ctrl_GameRecord.current_turn != "") {
	var _action_separator_index = string_pos("|", ctrl_GameRecord.current_turn);
	var _action = string_copy(ctrl_GameRecord.current_turn, 1, _action_separator_index - 1);
	ds_stack_push(_undo_actions, _action);
	ctrl_GameRecord.current_turn = string_delete(ctrl_GameRecord.current_turn, 1, _action_separator_index);
}

while (!ds_stack_empty(_undo_actions)) {
	var _action = ds_stack_pop(_undo_actions);
	var _action_type = string_copy(_action, 1, 2);
	var _action_params = string_delete(_action, 1, 2);
	
	//show_debug_message(["Undoing", _action_type, _action_params]);
	
	switch (_action_type) {
		case "PW":
			break;
		case "PS":
			GameRecord_undoPlayerMove(_action_params);
			break;
		case "PM":
			GameRecord_undoPsiMove(_action_params);
			break;
		case "PK":
			GameRecord_undoPsiKnockOut(_action_params);
			break;
		case "EM":
			GameRecord_undoEnemyMove(_action_params);
			break;
		case "KO":
			GameRecord_undoKnockOut(_action_params);
			break;
		case "TE":
			GameRecord_undoTurnEnd(_action_params);
			break;
	}
}

ds_stack_destroy(_undo_actions);

ds_map_clear(ctrl_GameState.disabled_units);
ctrl_GameState.actions_left = ctrl_GameState.max_actions;

with (ctrl_PlayerControl) {
	instance_destroy();
	/*
	PlayerControl_calculatePsiState();
	if (selected_ability != PlayerAbility.None)
		PlayerControl_selectAbility(PlayerAbility.None);
	else
		PlayerControl_populateDecisions();
	*/
}

GameFlow_beginTurn();
