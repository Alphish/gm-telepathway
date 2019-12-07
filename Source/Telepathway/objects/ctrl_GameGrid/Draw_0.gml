// draw the floor layer
for (var i = 0; i < width; i++)
for (var j = 0; j < height; j++) {
	var _tx = x + field_size * i;
	var _ty = y + field_size * j;

	var _field_type = GameGrid_getFieldType(i, j);
	if (_field_type != FieldType.Gap)
		draw_sprite(spr_Floor, 0, _tx, _ty);
	
	with (ctrl_PlayerControl) {
		if (ctrl_GameFlow.is_stable)
			PlayerControl_drawDecision(i, j);
	}
}

// draw the upper layer
for (var j = 0; j < height; j++)
for (var i = 0; i < width; i++) {
	var _tx = x + field_size * i;
	var _ty = y + field_size * j;

	var _field_type = GameGrid_getFieldType(i, j);
	if (_field_type == FieldType.Wall)
		draw_sprite(spr_Wall, 0, _tx, _ty);
	
	with (actors[# i, j]) {
		event_user(8);
	}
}

//draw_sprite_5slice(spr_TooltipSmall, 1, 160, 16, 128, 14, 4, 12);

if (description != "" && !instance_exists(ctrl_LevelWon)) {
	
var _color = make_color_rgb(97, 105, 134);
	draw_sprite_3slice_ext(spr_PortraitFrame, 0, 128, 640, 768, 32, 64, 32, _color, 1);

	draw_set_color(merge_color(_color, c_white, 0.75));
	draw_set_alpha(1);
	draw_set_halign(fa_top);
	draw_set_valign(fa_middle);

	draw_set_font(fnt_Description);
	draw_text_ext(160, room_height - 64, description, 20, 704);
	draw_set_color(c_white);
	draw_set_alpha(1);

	draw_sprite_3slice_ext(spr_PortraitFrame, 1, 128, 640, 768, 32, 64, 32, _color, 1);


}
