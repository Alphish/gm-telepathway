with (ctrl_EnemyMove) {
	event_user(0);
}

with (par_Actor) {
	event_user(0);
}

if (!GameFlow_isStable())
	exit;

with (ctrl_EnemyMove) {
	if (ds_list_empty(pending_actors)) {
		instance_destroy();
	}
}

if (!instance_exists(ctrl_EnemyMove)) {
	GameFlow_endTurn();
}
