if (mouse_in_circle(x + 32, y + 32, 32)) {
	if (mouse_check_button_pressed(mb_left)) {
		if (!warn_state)
			warn_state = true;
		else
			GameFlow_leave();
	}
}
else {
	warn_state = false;
}
