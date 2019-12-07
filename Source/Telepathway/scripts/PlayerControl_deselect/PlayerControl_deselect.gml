/// @function PlayerControl_deselect()

if (is_attack) {
	is_attack = false;
	target_path = undefined;
	target_x = undefined;
	target_y = undefined;
	PlayerControl_populateDecisions();
}
else {
	PlayerControl_selectAbility(PlayerAbility.None);
}
