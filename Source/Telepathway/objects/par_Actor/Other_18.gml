var _is_disabled = GameState_isDisabled(fx, fy);

var _attack_factor, _attack_xoffset, _attack_yoffset;
if (!performs_attack) {
	_attack_factor = 0;
	_attack_xoffset = 0;
	_attack_yoffset = 0;
}
else {
	_attack_factor = step_amount < 0.5 ? step_amount : 1 - step_amount;
	_attack_xoffset = _attack_factor * global.DIR8X[attack_direction] * FIELD_SIZE * attack_distance * 2;
	_attack_yoffset = _attack_factor * global.DIR8Y[attack_direction] * FIELD_SIZE * attack_distance * 2;
}

draw_sprite_ext(
	sprite_index, image_index,
	x + xshift + _attack_xoffset +  FIELD_SIZE div 2, y + yshift + _attack_yoffset + FIELD_SIZE div 2,
	current_side, 1, 0,
	_is_disabled ? c_black : c_white, 1
	);
