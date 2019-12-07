/// @function draw_tooltip_text(tipx,tipy,position,text)
/// @param {real} tipx
/// @param {real} tipy
/// @param {TooltipPosition} position
/// @param {string} text

var _tip_x = argument0;
var _tip_y = argument1;
var _position = argument2;
var _text = argument3;

var _width = string_width(_text) + 32;

var _sprite = spr_TooltipSmall;
var _height = sprite_get_height(_sprite);

var _coordinates = __tooltip_get_coordinates(_position, _tip_x, _tip_y, _width, _height);

draw_tooltip(_tip_x, _tip_y, _position, _width);

var _xoffset = 0;
var _yoffset = 0;

switch (_position) {
	case TooltipPosition.LeftCentered:
		_xoffset = -2;
		break;
	case TooltipPosition.BottomCentered:
		_yoffset = -2;
	case TooltipPosition.RightCentered:
		_xoffset = 2;
		break;
	case TooltipPosition.TopCentered:
	case TooltipPosition.TopLeft:
	case TooltipPosition.TopRight:
		_yoffset = -2;
		break;
}

draw_set_font(fnt_Stats);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(_coordinates[0] + _xoffset + (_width - abs(_xoffset)) div 2, _coordinates[1] + _yoffset + (_height  - abs(_yoffset)) div 2, _text);
