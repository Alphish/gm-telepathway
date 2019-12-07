for (var i = 0; i < grid_width; i++)
for (var j = 0; j < grid_height; j++) {
	var _tx = x + field_size * i;
	var _ty = y + field_size * j;
	var _ex = _tx + field_size div 2;
	var _ey = _ty + field_size div 2;
	
	switch (terrain[# i, j]) {
		case FieldType.Floor:
			draw_sprite(spr_Floor, 0, _tx, _ty);
			break;
		case FieldType.Wall:
			draw_sprite(spr_Floor, 0, _tx, _ty);
			draw_sprite(spr_Wall, 0, _tx, _ty);
			break;
	}

	if (is_hover) {
		draw_set_color(c_white);
		draw_set_alpha(0.3);
		var _mx = (mouse_x - x) div 32;
		var _my = (mouse_y - y) div 32;
		if (_mx == i && _my == j)
			draw_rectangle(x + 32 * _mx, y + 32 * _my, x + 32 * _mx + 31, y + 32 * _my + 31, true);
	
		draw_set_alpha(1);
	}

	switch (enemies[# i, j]) {
		case EnemyUnit.Player:
			draw_sprite(spr_Player, 0, _ex, _ey);
			break;
		case EnemyUnit.Soldier:
			draw_sprite(spr_Soldier, 0, _ex, _ey);
			break;
		case EnemyUnit.Assassin:
			draw_sprite(spr_Assassin, 0, _ex, _ey);
			break;
		case EnemyUnit.Gunner:
			draw_sprite(spr_Gunner, 0, _ex, _ey);
			break;
		case EnemyUnit.Drone:
			draw_sprite(spr_Drone, 0, _ex, _ey);
			break;
		case EnemyUnit.Grenadier:
			draw_sprite(spr_Grenadier, 0, _ex, _ey);
			break;
		case EnemyUnit.Tank:
			draw_sprite(spr_Tank, 0, _ex, _ey);
			break;
		case EnemyUnit.ESP:
			draw_sprite(spr_ESP, 0, _ex, _ey);
			break;
	}
}

