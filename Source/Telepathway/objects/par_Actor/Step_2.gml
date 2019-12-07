is_poked = false;

step_amount = step_progress / step_max;
x = ctrl_GameGrid.x + FIELD_SIZE * fx;
y = ctrl_GameGrid.y + FIELD_SIZE * fy;
xshift = !is_undefined(current_direction) ? step_amount * FIELD_SIZE * global.DIR8X[current_direction] : 0;
yshift = !is_undefined(current_direction) ? step_amount * FIELD_SIZE * global.DIR8Y[current_direction] : 0;

is_idle = current_direction == undefined && remaining_path == "" && !performs_attack;

if (step_progress == step_max div 2 && performs_attack) {
	switch (unit) {
		case EnemyUnit.Soldier:
			sfx_play(sfx_Taser);
			break;
		case EnemyUnit.Assassin:
			sfx_play(sfx_Darkness);
			break;
		case EnemyUnit.Gunner:
			sfx_play(sfx_Gunshot);
			break;
		case EnemyUnit.Drone:
			sfx_play(sfx_Gatling);
			break;
		case EnemyUnit.Grenadier:
			sfx_play(sfx_Explosion);
			break;
		case EnemyUnit.Tank:
			sfx_play(sfx_Cannon);
			break;
		case EnemyUnit.ESP:
			sfx_play(sfx_Poke);
			break;
	}
}
