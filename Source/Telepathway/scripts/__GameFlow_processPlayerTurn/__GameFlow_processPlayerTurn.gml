// accept player input

var _initially_stable = GameFlow_isStable();
if (_initially_stable) {
	with (ctrl_PlayerControl) {
		event_user(0);
	}
}

var _mid_stable = GameFlow_isStable();

with (par_Actor) {
	event_user(0);
}

is_poked = false;

var _eventually_stable = GameFlow_isStable();

if (_eventually_stable)
{
	var _enemies_remaining = false;
	for (var i = 0; i < ctrl_GameGrid.width; i++)
	for (var j = 0; j < ctrl_GameGrid.height; j++) {
		var _unit = GameGrid_getEnemyUnit(i, j);
		if (_unit == EnemyUnit.Player)
			continue;
		else if (_unit != EnemyUnit.None)
			_enemies_remaining = true;
	}	
	
	if (ctrl_GameState.actions_left != 0 && _enemies_remaining) {
		if (!_mid_stable)
			PlayerControl_selectAbility(PlayerAbility.None);
	}
	else {
		with (ctrl_PlayerControl) {
			instance_destroy();
		}
	
		if (_enemies_remaining)
			GameFlow_beginEnemyTurn();
		else
			GameFlow_beginWin();
	}
}
