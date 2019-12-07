with (obj_PlayerAbilitySelector) {
	event_user(0);
}

hover_x = undefined;
hover_y = undefined;

with (ctrl_GameGrid) {
	if (mouse_in_rectangle(x, y, field_size * width, field_size * height)) {
		other.hover_x = (mouse_x - x) div field_size;
		other.hover_y = (mouse_y - y) div field_size;
	}
}

if (is_undefined(hover_x) || is_undefined(hover_y) || decision_grid[# hover_x, hover_y] == DecisionType.None) {
	if (mouse_in_rectangle(128, 0, 768, 768) && mouse_check_button_pressed(mb_left))
		PlayerControl_deselect();
}

if (!is_undefined(hover_x) && !is_undefined(hover_y)) {
	var _hover_decision = decision_grid[# hover_x, hover_y];
	if (!DecisionType_isActive(_hover_decision)) {
		hover_x = undefined;
		hover_y = undefined;
		exit;
	}
	
	if (mouse_check_button_pressed(mb_left)) {
		PlayerControl_performDecision(hover_x, hover_y);
	}
}

