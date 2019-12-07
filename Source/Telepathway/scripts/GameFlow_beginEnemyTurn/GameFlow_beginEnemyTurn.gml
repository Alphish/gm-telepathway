/// @function GameFlow_beginEnemyTurn()

new(ctrl_EnemyAI);

new(ctrl_EnemyMove);

with (ctrl_EnemyAI)
	instance_destroy();

flow_state = __GameFlow_processEnemyTurn;
