/// @function __EditorGrid_resize(width,height)
/// @param {real} width
/// @param {real} height

var _width = argument0;
var _height = argument1;

grid_width = _width;
grid_height = _height;

ds_grid_resize_ext(terrain, _width, _height, FieldType.Floor);
ds_grid_resize_ext(enemies, _width, _height, EnemyUnit.None);

width = grid_width * field_size;
height = grid_height * field_size;

x = 368 - width div 2;
y = 368 - height div 2;
