/// @function GameRecord_addPsiKnockOut(cost,x,y)
/// @param {real} cost
/// @param {real} x
/// @param {real} y

var _cost = argument0;
var _x = argument1;
var _y = argument2;

GameRecord_add("PK" + string(_cost) + __GameRecord_encodeCoordinates(_x, _y));
