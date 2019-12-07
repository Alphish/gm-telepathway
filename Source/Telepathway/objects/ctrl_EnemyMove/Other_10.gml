step_progress += ctrl_GameFlow.animation_speed;

while (!ds_list_empty(pending_actors) && step_progress / step_max >= pending_actors[| 0]) {
	var _walker = pending_actors[| 1];
	ds_list_delete(pending_actors, 0);
	ds_list_delete(pending_actors, 0);
	
	var _x = _walker[0];
	var _y = _walker[1];
	var _path = _walker[2];
	with (par_Actor) {
		if (fx == _x && fy == _y)
			Actor_walk(_path);	
	}
}
