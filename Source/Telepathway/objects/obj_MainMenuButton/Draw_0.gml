var _color = make_color_rgb(83, 208, 196);

draw_set_color(_color);

draw_set_alpha(is_hover ? 0.4 : 0.2)
draw_rectangle(x, y, x+width-1, y+height-1, false);

draw_set_alpha(is_hover ? 1 : 0.7)
draw_rectangle(x, y, x+width-1, y+height-1, true);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_Announcement);
draw_text(x + width div 2, y + height div 2, text);

draw_set_color(c_white)
draw_set_alpha(1);
