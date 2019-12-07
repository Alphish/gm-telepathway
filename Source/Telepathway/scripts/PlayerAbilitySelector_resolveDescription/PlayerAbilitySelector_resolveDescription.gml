/// @PlayerAbilitySelector_resolveDescription()

switch (ability) {
	case PlayerAbility.None:
		return "View/select units";
	case PlayerAbility.MoveSelf:
		return "Move";
	case PlayerAbility.Rest:
		return "Rest";
	case PlayerAbility.Undo:
		if (ctrl_GameRecord.current_turn != "")
			return "Restart turn";
		else if (!ds_list_empty(ctrl_GameRecord.previous_turns))
			return "Undo previous turn";
		else
			return "Undo previous turn (no turns to undo)";
	case PlayerAbility.MovePreview:
		return "Show movement range";
	case PlayerAbility.AttackPreview:
		return "Show attack pattern";
	case PlayerAbility.Psi:
		return "Control mind (move " +
			string(ctrl_PlayerControl.selected_will + ctrl_PlayerControl.selected_interference + 1) + " psi, attack " +
			string(ctrl_PlayerControl.selected_will + ctrl_PlayerControl.selected_interference + 2) + " psi)";
	case PlayerAbility.KnockOut:
		return "Overload (" + string(ctrl_PlayerControl.selected_will + ctrl_PlayerControl.selected_interference + 3) + " psi, instant KO)";
}