var _frame_color = make_color_rgb(130, 90, 170);

draw_sprite_3slice_ext(spr_PortraitFrame, 0, 256, 0, 512, 32, 64, 32, _frame_color, 1);

draw_set_color(merge_color(_frame_color, c_white, 0.75));
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_font(fnt_Announcement);
draw_text(room_width div 2, 48, "YOU WON!");
draw_set_font(fnt_AnnouncementSub);
draw_text(room_width div 2, 80, "Click anywhere to continue");

draw_sprite_3slice_ext(spr_PortraitFrame, 1, 256, 0, 512, 32, 64, 32, _frame_color, 1);

draw_set_color(c_white);
draw_set_alpha(1);
