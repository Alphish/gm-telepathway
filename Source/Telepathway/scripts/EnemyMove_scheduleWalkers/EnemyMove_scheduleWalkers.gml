/// @function EnemyMove_scheduleWalkers(schedule)
/// @param {listId} schedule

var _schedule = argument0;

var _step_tracker = ds_grid_create(ctrl_GameGrid.width, ctrl_GameGrid.height);
ds_grid_clear(_step_tracker, -1);

for (var i = 0; i < ds_list_size(_schedule); i++) {
	__EnemyMove_scheduleWalker(_schedule[| i], _step_tracker);
}

ds_grid_destroy(_step_tracker);
