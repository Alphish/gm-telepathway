/// @function ds_grid_resize_ext(grid,width,height,value)
/// @param {gridId} grid
/// @param {real} width
/// @param {real} height
/// @param {any} value

var _grid = argument0;
var _width = argument1;
var _height = argument2;
var _value = argument3;

var _old_width = ds_grid_width(_grid);
var _old_height = ds_grid_height(_grid);

ds_grid_resize(_grid, _width, _height);
if (_old_width < _width)
	ds_grid_set_region(_grid, _old_width, 0, _width - 1, _height - 1, _value);
if (_old_height < _height)
	ds_grid_set_region(_grid, 0, _old_height, _width - 1, _height - 1, _value);
