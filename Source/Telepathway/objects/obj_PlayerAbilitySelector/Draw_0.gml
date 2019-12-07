var _colour = merge_color(c_black, image_blend, is_enabled ? (is_hover ? 1 : 0.7) : 0.4);

if (ctrl_PlayerControl.selected_ability == ability) {
	draw_sprite_ext(
		sprite_index, 0, x, y,
		1, 1, 0,
		_colour, 1
		);
	}

draw_sprite_ext(
	sprite_index, image_index, x, y,
	1, 1, 0,
	_colour, 1
	);

if (is_hover) {
	var _is_left = x < room_width div 2;
	var _text = PlayerAbilitySelector_resolveDescription();
	draw_tooltip_text(
		_is_left ? x + sprite_width : x, y + sprite_height div 2,
		_is_left ? TooltipPosition.RightCentered : TooltipPosition.LeftCentered,
		_text
		);
}

