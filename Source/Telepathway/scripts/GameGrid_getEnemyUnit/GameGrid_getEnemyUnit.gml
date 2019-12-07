/// @function GameGrid_getEnemyUnit(x,y)
/// @param {real} x
/// @param {real} y

var _x = argument0;
var _y = argument1;

if (_x >= 0 && _y >= 0 && _x < ctrl_GameGrid.width && _y < ctrl_GameGrid.height)
	return ctrl_GameGrid.enemies[# _x, _y];
else
	return EnemyUnit.None;
