/// @function PlayerAbilitySelector_create(x,y,image,ability,color)
/// @param {real} x
/// @param {real} y
/// @param {real} image
/// @param {PlayerAbility} ability
/// @param {color} color

var _x = argument0;
var _y = argument1;
var _image = argument2;
var _ability = argument3;
var _color = argument4;

with (instance_create_depth(_x, _y, -200, obj_PlayerAbilitySelector)) {
	image_index = _image;
	image_blend = _color;
	ability = _ability;
	
	event_user(1);
}
