/// @function draw_sprite_3slice(sprite,image,x,y,width,left,middle,right,color,alpha)
/// @param {spriteId} sprite
/// @param {real} image
/// @param {real} x
/// @param {real} y
/// @param {real} width
/// @param {real} left
/// @param {real} middle
/// @param {real} right

var _sprite = argument0;
var _image = argument1;
var _x = argument2;
var _y = argument3;
var _width = argument4;
var _left = argument5;
var _middle = argument6;
var _right = argument7;
var _color = argument8;
var _alpha = argument9;

var _sprite_width = sprite_get_width(_sprite)
var _sprite_height = sprite_get_height(_sprite);

var _midwidth = _width - _left - _right;
var _midfactor = _midwidth / _middle;

draw_sprite_part_ext(_sprite, _image, 0, 0, _left, _sprite_height, _x, _y, 1, 1, _color, _alpha);
draw_sprite_part_ext(_sprite, _image, _left, 0, _middle, _sprite_height, _x + _left, _y, _midfactor, 1, _color, _alpha);
draw_sprite_part_ext(_sprite, _image, _sprite_width - _right, 0, _right, _sprite_height, _x + _width - _right, _y, 1, 1, _color, _alpha);
