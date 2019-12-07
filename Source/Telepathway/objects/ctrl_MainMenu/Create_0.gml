with (instance_create_depth(16, 512, -100, obj_MainMenuButton)) {
	on_click = __MainMenu_bgmClick;
	text = "";
}

with (instance_create_depth(16, 592, -100, obj_MainMenuButton)) {
	on_click = __MainMenu_sfxClick;
	text = "";
}

with (instance_create_depth(16, 672, -100, obj_MainMenuButton)) {
	on_click = __MainMenu_fullscreenClick;
	text = "";
}



with (instance_create_depth(384, 512, -100, obj_MainMenuButton)) {
	on_click = __MainMenu_playClick;
	text = "Play";
}

with (instance_create_depth(384, 592, -100, obj_MainMenuButton)) {
	on_click = __MainMenu_helpClick;
	text = "Help/Story";
}

with (instance_create_depth(384, 672, -100, obj_MainMenuButton)) {
	on_click = __MainMenu_exitClick;
	text = "Exit";
}

bgm_play(bgm_Menu);
