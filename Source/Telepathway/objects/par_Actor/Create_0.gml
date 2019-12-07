fx = (x - ctrl_GameGrid.x) div FIELD_SIZE;
fy = (y - ctrl_GameGrid.y) div FIELD_SIZE;

current_side = 1;

remaining_path = "";
performs_attack = false;
attack_direction = undefined;
attack_distance = undefined;
current_direction = undefined;
step_progress = 0;
step_max = 16;

step_amount = 0;
xshift = 0;
yshift = 0;
is_idle = true;
