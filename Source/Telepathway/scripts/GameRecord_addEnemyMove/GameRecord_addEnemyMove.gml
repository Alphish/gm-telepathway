/// @function GameRecord_addPsiMove(x,y,path)
/// @param {real} x
/// @param {real} y
/// @param {string} path

var _x = argument0;
var _y = argument1;
var _path = argument2;

GameRecord_add("EM" + __GameRecord_encodeCoordinates(_x, _y) + _path);
