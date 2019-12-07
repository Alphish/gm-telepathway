/// @function GameState_disableUnit(x,y)
/// @param {real} x
/// @param {real} y

var _x = argument0;
var _y = argument1;

var _key = string(_x) + ":" + string(_y);

ds_map_add(ctrl_GameState.disabled_units, _key, true);
