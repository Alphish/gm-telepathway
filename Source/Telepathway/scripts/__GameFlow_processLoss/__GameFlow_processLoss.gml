if (mouse_check_button_pressed(mb_left) && !mouse_in_circle(obj_GiveUpButton.x + 32, obj_GiveUpButton.y + 32, 32)) {
	with (ctrl_LevelLost)
		instance_destroy();
		
	GameRecord_undoTurn();
}
