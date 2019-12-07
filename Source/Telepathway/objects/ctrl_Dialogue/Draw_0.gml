Portrait_draw(x, y, current_color, current_sprite, current_image);

draw_sprite_3slice_ext(spr_PortraitFrame, 0, 128, 0, 768, 32, 64, 32, current_color, 1);

draw_set_color(merge_color(current_color, c_white, 0.75));
draw_set_alpha(1);
draw_set_halign(fa_top);
draw_set_valign(fa_middle);

draw_set_font(fnt_AnnouncementSub);
draw_text_ext(192, room_height - 64, current_text, 20, 640);

draw_sprite_3slice_ext(spr_PortraitFrame, 1, 128, 0, 768, 32, 64, 32, current_color, 1);

draw_set_color(c_white);
draw_set_alpha(1);
