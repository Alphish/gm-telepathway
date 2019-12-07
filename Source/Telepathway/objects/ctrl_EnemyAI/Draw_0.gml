var _current_grid = display_grids[display_grid_idx];

	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);

for (var i = 0; i < width; i++)
for (var j = 0; j < height; j++) {
	if (is_undefined(_current_grid[# i, j]))
		continue;
	
	draw_text(ctrl_GameGrid.x + 32 * i + 16, ctrl_GameGrid.y + 32 * j + 16, string(_current_grid[# i, j]));
}

draw_text(640, 16, string(display_grid_idx));
