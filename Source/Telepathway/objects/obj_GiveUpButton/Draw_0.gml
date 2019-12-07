var _level_won = instance_exists(ctrl_LevelWon);

if (_level_won) {
	warn_state = false;
}

if (mouse_in_circle(x + 32, y + 32, 32)) {
	draw_sprite_ext(sprite_index, _level_won ? 1 : 0, x, y, 1, 1, 0, warn_state ? c_orange : c_white, 1);
	
	if (!_level_won)
		draw_tooltip_text(x, y + 32, TooltipPosition.LeftCentered, warn_state ? "Click again to confirm!" : "Give up?");
}
else {
	draw_sprite_ext(sprite_index, _level_won ? 1 : 0, x, y, 1, 1, 0, c_white, 0.7);
}
