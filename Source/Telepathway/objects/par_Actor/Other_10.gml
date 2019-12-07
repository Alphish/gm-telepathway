if (current_direction == undefined) {
	Actor_tryAttack();
	
	if (remaining_path != "")
	{
		current_direction = real(string_char_at(remaining_path, 1));
		remaining_path = string_delete(remaining_path, 1, 1);
	}
	
	if (remaining_path == "" && !performs_attack)
		exit;
}

step_progress += ctrl_GameFlow.animation_speed;
	
while (step_progress >= step_max) {
	step_progress -= step_max;
	if (!performs_attack) {
		Actor_move(fx + global.DIR8X[current_direction], fy + global.DIR8Y[current_direction]);
	}
	else {
		performs_attack = false;
		attack_direction = undefined;
		attack_distance = undefined;
	}
	
	Actor_tryAttack();

	if (remaining_path == "") {
		current_direction = undefined;
		step_progress = 0;
		exit;
	}
	else {
		current_direction = real(string_char_at(remaining_path, 1));
		remaining_path = string_delete(remaining_path, 1, 1);
	}
}
