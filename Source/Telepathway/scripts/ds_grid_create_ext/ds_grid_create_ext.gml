/// @function ds_grid_create(width,height,value)
/// @param {real} width
/// @param {real} height
/// @param {any} value

var _width = argument0;
var _height = argument1;
var _value = argument2;

var _grid = ds_grid_create(_width, _height);
ds_grid_clear(_grid, _value);
return _grid;
