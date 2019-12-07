animation_speed = 1;
is_poked = false;
is_stable = true;

flow_state = undefined;

new(ctrl_GameState);
new(ctrl_GameRecord);

instance_create_depth(room_width - 96, room_height - 96, -300, obj_GiveUpButton);

GameGrid_create(global.level_info);

GameFlow_beginTurn();

switch (global.level_index) {
	case 0: case 1: case 2:
		bgm_play(bgm_Area1);
		break;
	case 3: case 4: case 5:
		bgm_play(bgm_Area2);
		break;
	case 6: case 7: case 8:
		bgm_play(bgm_Area3);
		break;
	case 9: case 10: case 11:
		bgm_play(bgm_Area4);
		break;
}

// quick ugly addition
tutorial_entry = 0;
