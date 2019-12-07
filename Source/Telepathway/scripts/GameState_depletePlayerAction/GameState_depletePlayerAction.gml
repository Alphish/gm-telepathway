/// @function GameState_depletePlayerAction()

with (ctrl_GameFlow) {
	if (argument_count < 1 || !argument[0])
		ctrl_GameState.actions_left--;
	else
		ctrl_GameState.actions_left = 0;
}