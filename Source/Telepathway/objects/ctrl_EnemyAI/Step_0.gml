if (keyboard_check_pressed(vk_space)) {
	display_grid_idx++;
	display_grid_idx = display_grid_idx mod array_length_1d(display_grids);
}
