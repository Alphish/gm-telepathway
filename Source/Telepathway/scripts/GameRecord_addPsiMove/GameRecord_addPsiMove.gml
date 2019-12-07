/// @function GameRecord_addPsiMove(cost,x,y,path)
/// @param {real} cost
/// @param {real} x
/// @param {real} y
/// @param {string} path

var _cost = argument0;
var _x = argument1;
var _y = argument2;
var _path = argument3;

GameRecord_add("PM" + string(_cost) + __GameRecord_encodeCoordinates(_x, _y) + _path);
