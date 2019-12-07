if (keyboard_check_pressed(vk_left) && grid_width > 5)
	__EditorGrid_resize(grid_width - 1, grid_height);

if (keyboard_check_pressed(vk_right) && grid_width < 20)
	__EditorGrid_resize(grid_width + 1, grid_height);

if (keyboard_check_pressed(vk_up) && grid_height > 5)
	__EditorGrid_resize(grid_width, grid_height - 1);

if (keyboard_check_pressed(vk_down) && grid_height < 20)
	__EditorGrid_resize(grid_width, grid_height + 1);
	