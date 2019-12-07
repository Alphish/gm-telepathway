width = ctrl_GameGrid.width;
height = ctrl_GameGrid.height;

attack_reach = ds_grid_create(width, height);
soldier_distance = ds_grid_create(width, height);
assassin_distance = ds_grid_create(width, height);
charger_distance = ds_grid_create(width, height);
gunner_distance = ds_grid_create(width, height);
drone_distance = ds_grid_create(width, height);
gridbane_distance = ds_grid_create(width, height);
grenadier_distance = ds_grid_create(width, height);
esp_distance = ds_grid_create(width, height);
tank_distance = ds_grid_create(width, height);

dangers = ds_grid_create(width, height);
walkers_schedule = ds_list_create();
liners_schedule = ds_list_create();

display_grids = [
	assassin_distance,
	attack_reach,
	soldier_distance,
	charger_distance,
	gunner_distance,
	drone_distance,
	gridbane_distance,
	grenadier_distance,
	esp_distance,
	tank_distance
];
display_grid_idx = 0;

var timer = get_timer();
EnemyAI_populateAttackReach();
EnemyAI_populateDistances();
EnemyAI_planMoves();
show_debug_message(get_timer() - timer);

depth = -200;
