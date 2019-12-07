/// @function PlayerControl_populateDecisions()

ds_grid_clear(decision_grid, DecisionType.None);
ds_grid_clear(movement_path, "");

switch (selected_ability) {
	case PlayerAbility.None:
		for (var i = 0; i < width; i++)
		for (var j = 0; j < height; j++) {
			decision_grid[# i, j] = (psi_interference[# i, j] && GameGrid_getFieldType(i, j) != FieldType.Wall) ? DecisionType.PlainPsi : DecisionType.None;
		}

		__PlayerControl_populateActorDecisions();
		break;
	
	case PlayerAbility.MoveSelf:
		decision_grid[# ctrl_GameGrid.player_x, ctrl_GameGrid.player_y] = DecisionType.Player;
		for (var i = 0; i < 8; i++) {
			var _xoffset = global.DIR8X[i];
			var _yoffset = global.DIR8Y[i];
			var _x = ctrl_GameGrid.player_x + _xoffset;
			var _y = ctrl_GameGrid.player_y + _yoffset;
			
			if (GameGrid_getFieldType(_x, _y) == FieldType.Floor && ctrl_GameGrid.enemies[# _x, _y] == EnemyUnit.None) {
				decision_grid[# _x, _y] = DecisionType.Move;
				movement_path[# _x, _y] = string(i);
			}
		}
		break;
	
	case PlayerAbility.MovePreview:
		__PlayerControl_populateMoveDecisions();
		break;
		
	case PlayerAbility.AttackPreview:
		__PlayerControl_populateAttackDecisions();
		break;

	/*
	case PlayerAbility.Move:
		__PlayerControl_populateMoveDecisions();
		break;
	
	case PlayerAbility.Attack:
		if (!is_attack) {
			__PlayerControl_populateMoveDecisions();
		}
		else {
			__PlayerControl_populateAttackDecisions();
		}
		break;
	*/
	
	case PlayerAbility.Psi:
		if (!is_attack) {
			__PlayerControl_populateMoveDecisions();
		}
		else {
			__PlayerControl_populateAttackDecisions();
		}
		break;
}
