/// @function GameGrid_populateAttackReach()

ds_grid_clear(attack_reach, AttackReach.None);

var _x, _y;

// different kinds of 8-directional strikes
for (var dr = 0; dr < 8; dr++) {
	var _xoffset = global.DIR8X[dr];
	var _yoffset = global.DIR8Y[dr];
	
	for (var _dist = 1; _dist <= 4; _dist++) {
		var _x = ctrl_GameGrid.player_x + _dist * _xoffset;
		var _y = ctrl_GameGrid.player_y + _dist * _yoffset;
		
		if (GameGrid_getFieldType(_x, _y) == FieldType.Wall)
			break;
		
		__EnemyAI_markAttackReach(_x, _y, _dist, true);
	}
}

// auxiliary grenade-strike detonations
for (var gdr = 0; gdr < 8; gdr++) {
	var _refx = ctrl_GameGrid.player_x + global.DIR8X[gdr];
	var _refy = ctrl_GameGrid.player_y + global.DIR8Y[gdr];
	if (GameGrid_getFieldType(_refx, _refy) != FieldType.Floor)
		continue;

	for (var dr = 0; dr < 8; dr++) {
		var _xoffset = global.DIR8X[dr];
		var _yoffset = global.DIR8Y[dr];
	
		for (var _dist = 1; _dist <= 2; _dist++) {
			var _x = _refx + _dist * _xoffset;
			var _y = _refy + _dist * _yoffset;
		
			if (GameGrid_getFieldType(_x, _y) == FieldType.Wall)
				break;
		
			__EnemyAI_markAttackReach(_x, _y, _dist, false);
		}
	}
}


// linestrike
for (var dr = 0; dr < 8; dr += 2) {
	var _xoffset = global.DIR8X[dr];
	var _yoffset = global.DIR8Y[dr];
	
	var _spread = 1;
	while (true) {
		var _x = ctrl_GameGrid.player_x + _spread * _xoffset;
		var _y = ctrl_GameGrid.player_y + _spread * _yoffset;
		
		if (GameGrid_getFieldType(_x, _y) == FieldType.Wall)
			break;
		
		attack_reach[# _x, _y] |= AttackReach.LineStrike | AttackReach.IsDirect;
		_spread++;
	}
}
