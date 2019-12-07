/// @function draw_tooltip(tipx,tipy,position,width)
/// @param {real} tipx
/// @param {real} tipy
/// @param {TooltipPosition} position
/// @param {real} width

var _tip_x = argument0;
var _tip_y = argument1;
var _position = argument2;
var _width = argument3;

var _sprite = spr_TooltipSmall;
var _height = sprite_get_height(_sprite);

var _coordinates = __tooltip_get_coordinates(_position, _tip_x, _tip_y, _width, _height);
var _x = _coordinates[0];
var _y = _coordinates[1];
switch (_position) {
	case TooltipPosition.LeftCentered:
		draw_sprite_3slice(spr_TooltipSmall, 0, _x, _y, _width, 16, 16, 16);
		break;
	case TooltipPosition.BottomCentered:
		draw_sprite_5slice(spr_TooltipSmall, 1, _x, _y, _width, 14, 4, 12);
		break;
	case TooltipPosition.RightCentered:
		draw_sprite_3slice(spr_TooltipSmall, 2, _x, _y, _width, 16, 16, 16);
		break;
	case TooltipPosition.TopCentered:
		draw_sprite_5slice(spr_TooltipSmall, 3, _x, _y, _width, 14, 4, 12);
		break;
	case TooltipPosition.TopLeft:
		draw_sprite_3slice(spr_TooltipSmall, 4, _x, _y, _width, 24, 8, 16);
		break;
	case TooltipPosition.TopRight:
		draw_sprite_3slice(spr_TooltipSmall, 5, _x, _y, _width, 16, 8, 24);
		break;
}
