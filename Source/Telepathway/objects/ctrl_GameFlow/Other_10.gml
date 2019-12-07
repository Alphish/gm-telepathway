/// @description Stuffing tutorial control here
if (global.level_index = 0) {
	switch (tutorial_entry) {
		case 0:
			if (instance_exists(ctrl_PlayerControl) && !ds_list_empty(ctrl_GameRecord.previous_turns))
				tutorial_entry = 1;
			break;
		case 1:
			if (instance_exists(ctrl_PlayerControl) && ctrl_GameState.current_psi >= 2)
				tutorial_entry = 2;			
				break;
		case 2:
			var _soldiers_remaining = 0;
			for (var i = 0; i < ctrl_GameGrid.width; i++)
			for (var j = 0; j < ctrl_GameGrid.height; j++) {
				if (GameGrid_getEnemyUnit(i, j) == EnemyUnit.Soldier)
					_soldiers_remaining++;
			}
		
			if (instance_exists(ctrl_PlayerControl) && _soldiers_remaining < 2)
				tutorial_entry = 3;			
				break;
		case 3:
			if (instance_exists(ctrl_PlayerControl) && ctrl_GameState.current_psi >= 3)
				tutorial_entry = 4;			
				break;
		case 4:
				break;
	}
	switch (tutorial_entry) {
		case 0:
			ctrl_GameGrid.description = "Uh-oh, an enemy is too close! Better move them elsewhere.\nClick on an enemy to activate Mind Control mode, then click one of green cells. You'll spend 1 PSI and 1 action.\nYou can use the remaining action to move the protagonist.";
			break;
		case 1:
			ctrl_GameGrid.description = "To win, you have to knock out all enemies. Mind-controlled attack will help here. It requires 2 points of PSI and you restore only 1 PSI each turn.\nLet's conserve PSI for now. You get 2 actions each turn, so use them both to put some extra distance between you and opponents.";
			break;
		case 2:
			ctrl_GameGrid.description = "With 2 points of PSI you can force an enemy to attack another. Click on the enemy, then click one of yellow cells to select the spot to attack from.\nA valid target will be marked with a red cell. Click it to attack.\nYou can click the Undo button if you make a mistake in the process.";
			break;
		case 3:
			ctrl_GameGrid.description = "One of enemies is down, but there's still one pursuer. To take them down, you need to use Overload ability. It costs 3 points of PSI, so push the remaining opponent to a safe distance.\nYou can use the Rest option to end your turn early.";
			break;
		case 4:
			ctrl_GameGrid.description = "With 3 points of PSI the Overload ability is available.\nClick on the enemy, then click the Overload button from the right-side panel.\nIt will knock out the remaining opponent right away, simple as that.";
			break;
	}
}
