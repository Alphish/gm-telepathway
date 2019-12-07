/// @function __tooltip_get_coordinates(position,tipx,tipy,width,height)
/// @param {TooltipPosition} position
/// @param {real} tipx
/// @param {real} tipy
/// @param {real} width
/// @param {real} height

var _position = argument0;
var _tip_x = argument1;
var _tip_y = argument2;
var _width = argument3;
var _height = argument4;

switch (_position) {
	case TooltipPosition.LeftCentered:
		return [_tip_x - _width, _tip_y - _height div 2];
	case TooltipPosition.BottomCentered:
		return [_tip_x - _width div 2, _tip_y];
	case TooltipPosition.RightCentered:
		return [_tip_x, _tip_y - _height div 2];
	case TooltipPosition.TopCentered:
		return [_tip_x - _width div 2, _tip_y - _height];
	case TooltipPosition.TopLeft:
		return [_tip_x + 32 - _width, _tip_y - _height];
	case TooltipPosition.TopRight:
		return [_tip_x - 32, _tip_y - _height];
}
