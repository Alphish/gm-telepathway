var _frame_color = make_color_rgb(120, 80, 128);

Portrait_draw(x, y, _frame_color, portrait_Veria, 0);

draw_sprite_3slice_vertical_ext(spr_PortraitFrame, 0, x, y + 128, 512, 32, 64, 32, _frame_color, 1);

// draw inner stuff

draw_sprite_3slice_vertical_ext(spr_PortraitFrame, 1, x, y + 128, 512, 32, 64, 32, _frame_color, 1);

EnemyIcon_draw(
	x + 32, y + 180, 9, make_color_rgb(199, 139, 88),
	string(ctrl_GameState.actions_left) + "/" + string(ctrl_GameState.max_actions),
	string(ctrl_GameState.actions_left) + " action" + ((ctrl_GameState.actions_left == 1) ? "" : "s") + " left"
	);

EnemyIcon_draw(
	x + 32, y + 220, 10, make_color_rgb(64, 219, 170),
	string(ctrl_GameState.current_psi) + "/" + string(ctrl_GameState.max_psi),
	string(ctrl_GameState.current_psi) + " PSI left"
	);
	
if (mouse_in_rectangle(x, y, 128, 128)) {
	draw_tooltip_text(x + 128, y + 64, TooltipPosition.RightCentered, "Veria (must be protected)");
}
