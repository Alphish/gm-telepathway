/// @function EnemyIcon_draw(x,y,icon,color,blurb,tooltip)
/// @param {real} x
/// @param {real} y
/// @param {real} icon
/// @param {color} color
/// @param {string} blurb
/// @param {string} tooltip

var _x = argument0;
var _y = argument1;
var _icon = argument2;
var _color = argument3;
var _blurb = argument4;
var _tooltip = argument5;

draw_sprite_ext(spr_EnemyIcon, _icon, _x + 4, _y + 4, 1, 1, 0, _color, 0.7);

draw_set_font(fnt_Stats);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(_color);
draw_set_alpha(0.7);

draw_text(_x + 48, _y + 16, _blurb);

draw_set_color(c_white);
draw_set_alpha(1);

if (mouse_in_rectangle(_x, _y, 64, 32)) {
	var _is_left = _x < room_width div 2;

	draw_tooltip_text(_is_left ? _x + 64 : _x, _y + 16, _is_left ? TooltipPosition.RightCentered : TooltipPosition.LeftCentered, _tooltip);
}
