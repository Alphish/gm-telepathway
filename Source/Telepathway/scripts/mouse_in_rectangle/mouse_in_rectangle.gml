/// @function mouse_in_rectangle(x,y,w,h)
/// @param {real} x
/// @param {real} y
/// @param {real} w
/// @param {real} h

var _x = argument0;
var _y = argument1;
var _w = argument2;
var _h = argument3;

return mouse_x >= _x && mouse_y >= _y && mouse_x < _x + _w && mouse_y < _y + _h;
