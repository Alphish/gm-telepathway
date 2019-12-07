/// @function PlayerControl_calculatePsiState()

ds_grid_clear(psi_interference, false);
for (var i = 0; i < width; i++)
for (var j = 0; j < height; j++) {
	if (GameGrid_getEnemyUnit(i, j) == EnemyUnit.ESP) {
		ds_grid_set_region(psi_interference, max(0, i-2), max(0, j-2), min(width-1, i+2), min(height-1, j+2), true);
	}
}

player_interference = psi_interference[# ctrl_GameGrid.player_x, ctrl_GameGrid.player_y];
selected_interference = player_interference || (!is_undefined(selected_x) && !is_undefined(selected_y) && psi_interference[# selected_x, selected_y]);
selected_will = (!is_undefined(selected_x) && !is_undefined(selected_y)) ? Data_getEnemyUnitProperty(GameGrid_getEnemyUnit(selected_x, selected_y), EnemyUnitProperty.Will) : 0;
psi_penalty = selected_will + (selected_interference ? 1 : 0);
max_psi = clamp(0, ctrl_GameState.current_psi - psi_penalty, 3);
