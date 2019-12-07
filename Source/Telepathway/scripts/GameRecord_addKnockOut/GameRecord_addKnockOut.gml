/// @function GameRecord_addKnockOut(actorIdx,x,y)
/// @param {real} actorIdx
/// @param {real} x
/// @param {real} y

var _actor_idx = argument0;
var _x = argument1;
var _y = argument2;

var _actor_str = (_actor_idx < 10 ? "0" : "") + string(_actor_idx);

GameRecord_add("KO" + _actor_str + __GameRecord_encodeCoordinates(_x, _y));
