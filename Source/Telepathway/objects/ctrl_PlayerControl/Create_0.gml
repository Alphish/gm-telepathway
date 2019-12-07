width = ctrl_GameGrid.width;
height = ctrl_GameGrid.height;

psi_interference = ds_grid_create(width, height);

selected_x = undefined;
selected_y = undefined;
selected_ability = PlayerAbility.None;
selected_actor = noone;

is_attack = false;
target_path = undefined;
target_x = undefined;
target_y = undefined;

decision_grid = ds_grid_create_ext(width, height, DecisionType.None);
movement_path = ds_grid_create_ext(width, height, "");

hover_x = undefined;
hover_y = undefined;

instance_create_depth(0, 0, -100, ui_PlayerWing);
instance_create_depth(896, 0, -100, ui_EnemyWing);

PlayerControl_selectTarget(undefined, undefined);
PlayerControl_populateDecisions();
