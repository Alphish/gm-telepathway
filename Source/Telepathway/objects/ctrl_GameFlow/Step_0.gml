with (par_Actor) {
	if (current_direction != undefined && remaining_path != "")
		ctrl_GameGrid.actors[# fx, fy] = noone;
	else
		ctrl_GameGrid.actors[# fx, fy] = id;
}

script_execute(flow_state);

is_stable = GameFlow_isStable();

with (par_Actor) {
	ctrl_GameGrid.actors[# fx, fy] = id;
}

is_poked = false;

with (obj_GiveUpButton) {
	event_user(0);
}

// tutorial stuff
event_user(0);
