var _is_completed = SaveState_getCompletion() > level_index;
var _is_available = SaveState_getCompletion() >= level_index;

var _base_color;
if (_is_completed)
	_base_color = c_lime;
else if (_is_available)
	_base_color = c_silver;
else
	_base_color = make_color_rgb(64, 64, 64);

var _frame_color = merge_color(c_black, _base_color, is_hover && _is_available ? 1 : 0.7);

Portrait_draw(x, y, _frame_color, _is_available ? undefined : undefined, level_index);

if (!_is_available)
	exit;
	
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_font(fnt_Announcement);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x + 64, y + 64, string(level_index + 1));
