/// @description Accept clickables input

hover_object = noone;

with (par_Clickable) {
	event_user(0);
}

if (mouse_check_button_pressed(mb_left)) {
	with (hover_object) {
		if (!is_undefined(on_click))
			script_execute(on_click);
	}
}
