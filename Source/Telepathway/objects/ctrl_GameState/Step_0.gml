if (keyboard_check(ord("P")) && keyboard_check(ord("S")) && keyboard_check(ord("I"))) {
	current_psi = max_psi;
	with (ctrl_PlayerControl) {
		PlayerControl_calculatePsiState();
		PlayerControl_populateDecisions();
	}
}