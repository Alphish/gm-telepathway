is_hover = false;

if (mouse_in_rectangle(x,y,width,height)) {
	is_hover = true;
}

event_user(1);

if (is_enabled && is_hover && mouse_check_button_pressed(mb_left)) {
	with (ctrl_PlayerControl) {
		if (other.ability == PlayerAbility.Rest) {
			GameState_rest();
			PlayerControl_selectAbility(PlayerAbility.None);
			GameState_depletePlayerAction(true);
			GameFlow_poke();
		}
		else if (other.ability == PlayerAbility.KnockOut) {
			var _cost = GameState_depletePsi(3, selected_will, selected_interference);
			GameRecord_addPsiKnockOut(_cost, selected_x, selected_y);
			sfx_play(sfx_Overload);

			GameGrid_knockOut(selected_x, selected_y);
			GameState_depletePlayerAction();
			GameFlow_poke();
		}
		else if (other.ability == PlayerAbility.Undo) {
			GameRecord_undoTurn();
		}
		else {
			PlayerControl_selectAbility(other.ability);
		}
	}
}
