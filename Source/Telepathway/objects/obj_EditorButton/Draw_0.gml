is_selected = terrain_cursor == ctrl_Editor.terrain_cursor && enemy_cursor == ctrl_Editor.enemy_cursor;

draw_sprite_ext(sprite, 0, x + xoffset, y + yoffset, 1, 1, 0, c_white, is_selected ? 1 : 0.5);