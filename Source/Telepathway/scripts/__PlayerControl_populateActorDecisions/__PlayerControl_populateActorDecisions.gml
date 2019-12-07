// __PlayerControl_populateActorDecisions()

for (var i = 0; i < width; i++)
for (var j = 0; j < height; j++) {
	if (GameState_isDisabled(i, j))
		continue;
	
	var _enemy_unit = GameGrid_getEnemyUnit(i, j);
	if(_enemy_unit == EnemyUnit.None)
		continue;
			
	if (_enemy_unit == EnemyUnit.Player) {
		decision_grid[# i, j] = DecisionType.Player;
		continue;
	}
	
	var _has_interference = psi_interference[# i, j] || psi_interference[# ctrl_GameGrid.player_x, ctrl_GameGrid.player_y];
	var _max_psi = clamp(0, ctrl_GameState.current_psi - Data_getEnemyUnitProperty(_enemy_unit, EnemyUnitProperty.Will) - (_has_interference ? 1 : 0), 3);
	
	switch (_max_psi) {
		case 0:
			decision_grid[# i, j] = _has_interference ? DecisionType.ActorPreviewPsi : DecisionType.ActorPreview;
			break;
		case 1:
			decision_grid[# i, j] = _has_interference ? DecisionType.MovePsi : DecisionType.Move;
			break;
		case 2:
			decision_grid[# i, j] = _has_interference ? DecisionType.MoveAttackPsi : DecisionType.MoveAttack;
			break;
		case 3:
			decision_grid[# i, j] = _has_interference ? DecisionType.KnockOutPsi : DecisionType.KnockOut;
			break;
	}
}
		