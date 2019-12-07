/// @function SpriteButton_create(x,y,depth,sprite,image,onClick)
/// @param {real} x
/// @param {real} y
/// @param {real} depth
/// @param {spriteId} sprite
/// @param {real} image
/// @param {scriptId} onClick

var _x = argument0;
var _y = argument1;
var _depth = argument2;
var _sprite = argument3;
var _image = argument4;
var _on_click = argument5;

with (instance_create_depth(_x, _y, _depth, obj_SpriteClickable)) {
	sprite_index = _sprite;
	image_index = _image;
	image_speed = 0;
	width = sprite_get_width(sprite_index);
	height = sprite_get_height(sprite_index);
	on_click = _on_click;
}

