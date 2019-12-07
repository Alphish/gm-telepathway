is_enabled = true;
if (ability == PlayerAbility.Psi && ctrl_PlayerControl.max_psi < 1)
	is_enabled = false;
if (ability == PlayerAbility.KnockOut && ctrl_PlayerControl.max_psi < 3)
	is_enabled = false;