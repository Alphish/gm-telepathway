/// @function draw_sprite_3slice(sprite,image,x,y,width,outside,inside,middle)
/// @param {spriteId} sprite
/// @param {real} image
/// @param {real} x
/// @param {real} y
/// @param {real} width
/// @param {real} outside
/// @param {real} inside
/// @param {real} middle

var _sprite = argument0;
var _image = argument1;
var _x = argument2;
var _y = argument3;
var _width = argument4;
var _outside = argument5;
var _inside = argument6;
var _middle = argument7;

var _sprite_width = sprite_get_width(_sprite)
var _sprite_height = sprite_get_height(_sprite);

var _inside_width = (_width - 2 * _outside - _middle) div 2;
var _inside_factor = _inside_width / _inside;

draw_sprite_part(_sprite, _image, 0, 0, _outside, _sprite_height, _x, _y);
draw_sprite_part_ext(_sprite, _image, _outside, 0, _inside, _sprite_height, _x + _outside, _y, _inside_factor, 1, c_white, 1);
draw_sprite_part(_sprite, _image, _outside + _inside, 0, _middle, _sprite_height, _x + (_width - _middle) div 2, _y);
draw_sprite_part_ext(_sprite, _image, _sprite_width - _outside - _inside, 0, _inside, _sprite_height, _x + (_width + _middle) div 2, _y, _inside_factor, 1, c_white, 1);
draw_sprite_part(_sprite, _image, _sprite_width - _outside, 0, _outside, _sprite_height, _x + _width - _outside, _y);
