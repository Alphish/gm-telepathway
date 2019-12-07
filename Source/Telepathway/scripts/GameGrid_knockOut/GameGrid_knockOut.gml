/// @function GameGrid_knockOut(x,y)
/// @param {real} x
/// @param {real} y

var _x = argument0;
var _y = argument1;

ctrl_GameGrid.enemies[# _x, _y] = EnemyUnit.None;
ctrl_GameGrid.actors[# _x, _y] = noone;
with (par_Actor) {
	if (fx == _x && fy == _y) {
		GameRecord_addKnockOut(actor_index, fx, fy);
		instance_destroy();
	}
}
