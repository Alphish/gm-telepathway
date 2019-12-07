/// @function mouse_in_circle(x,y,radius)
/// @param {real} x
/// @param {real} y
/// @param {real} radius

var _x = argument0;
var _y = argument1;
var _radius = argument2;

return sqr(mouse_x - _x) + sqr(mouse_y - _y) <= sqr(_radius);
