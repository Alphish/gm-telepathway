/// @function GameFlow_beginTurn()

var _player_remaining = false;
var _enemies_remaining = false;
for (var i = 0; i < ctrl_GameGrid.width; i++)
for (var j = 0; j < ctrl_GameGrid.height; j++) {
	var _unit = GameGrid_getEnemyUnit(i, j);
	if (_unit == EnemyUnit.Player)
		_player_remaining = true;
	else if (_unit != EnemyUnit.None)
		_enemies_remaining = true;
}

if (!_player_remaining) {
	GameFlow_beginLoss();
	exit;
}

if (!_enemies_remaining) {
	GameFlow_beginWin();
	exit;
}

GameFlow_beginPlayerTurn();
