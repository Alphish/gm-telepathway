/// @function GameState_isDisabled(x,y)
/// @param {real} x
/// @param {real} y

var _x = argument0;
var _y = argument1;

var _key = string(_x) + ":" + string(_y);

return ds_map_exists(ctrl_GameState.disabled_units, _key);
