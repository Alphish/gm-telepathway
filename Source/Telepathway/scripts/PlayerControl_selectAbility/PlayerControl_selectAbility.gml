/// @function PlayerControl_selectAbility(ability)
/// @param {PlayerAbility} ability

with (ctrl_PlayerControl) {
	var _ability = argument0;

	if (selected_ability == _ability)
		exit;

	selected_ability = _ability;
	switch (_ability) {
		case PlayerAbility.None:
		case PlayerAbility.MoveSelf:
			PlayerControl_selectTarget(undefined, undefined);
			is_attack = false;
			target_path = undefined;
			target_x = undefined;
			target_y = undefined;
			break;
		case PlayerAbility.MovePreview:
		case PlayerAbility.AttackPreview:
		case PlayerAbility.Psi:
			is_attack = false;
			target_path = undefined;
			target_x = undefined;
			target_y = undefined;
			break;
	}

	PlayerControl_populateDecisions();
}