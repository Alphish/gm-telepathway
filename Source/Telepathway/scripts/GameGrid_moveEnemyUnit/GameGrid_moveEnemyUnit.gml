/// @function GameGrid_moveEnemyUnit(x,y,endx,endy)
/// @param {real} x
/// @param {real} y
/// @param {real} endx
/// @param {real} endy

var _x = argument0;
var _y = argument1;
var _endx = argument2;
var _endy = argument3;

if (_x == _endx && _y == _endy)
	exit;

ctrl_GameGrid.enemies[# _endx, _endy] = ctrl_GameGrid.enemies[# _x, _y];
ctrl_GameGrid.enemies[# _x, _y] = EnemyUnit.None;
