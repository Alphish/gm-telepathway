/// @function Portrait_draw(x,y,frameColor,sprite,image)
/// @param {real} x
/// @param {real} y
/// @param {color} frameColor
/// @param {spriteId} sprite
/// @param {real} image

var _x = argument0;
var _y = argument1;
var _frame_color = argument2;
var _sprite = argument3;
var _image = argument4;

draw_sprite_ext(spr_PortraitFrame, 0, _x, _y, 1, 1, 0, _frame_color, 1);
if (!is_undefined(_sprite) && !is_undefined(_image))
	draw_sprite(_sprite, _image, _x, _y);

draw_sprite_ext(spr_PortraitFrame, 1, _x, _y, 1, 1, 0, _frame_color, 1);
