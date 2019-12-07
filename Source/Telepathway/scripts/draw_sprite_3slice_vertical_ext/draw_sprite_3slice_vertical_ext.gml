/// @function draw_sprite_3slice_vertical_ext(sprite,image,x,y,height,top,middle,bottom,color,alpha)
/// @param {spriteId} sprite
/// @param {real} image
/// @param {real} x
/// @param {real} y
/// @param {real} height
/// @param {real} top
/// @param {real} middle
/// @param {real} bottom
/// @param {color} color
/// @param {alpha} alpha

var _sprite = argument0;
var _image = argument1;
var _x = argument2;
var _y = argument3;
var _height = argument4;
var _top = argument5;
var _middle = argument6;
var _bottom = argument7;
var _color = argument8;
var _alpha = argument9;

var _sprite_width = sprite_get_width(_sprite)
var _sprite_height = sprite_get_height(_sprite);

var _midheight = _height - _top - _bottom;
var _midfactor = _midheight / _middle;

draw_sprite_part_ext(_sprite, _image, 0, 0, _sprite_width, _top, _x, _y, 1, 1, _color, _alpha);
draw_sprite_part_ext(_sprite, _image, 0, _top, _sprite_width, _middle, _x, _y + _top, 1, _midfactor, _color, _alpha);
draw_sprite_part_ext(_sprite, _image, 0, _sprite_height - _bottom, _sprite_width, _bottom, _x, _y + _height - _bottom, 1, 1, _color, _alpha);
