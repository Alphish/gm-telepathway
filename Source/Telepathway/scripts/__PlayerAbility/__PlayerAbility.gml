enum PlayerAbility {
	// own
	None,	// aka observe
	MoveSelf,
	Rest,	// instant
	Undo,	// instant
	// enemies
	MovePreview,
	AttackPreview,
	Psi,
	KnockOut	// instant
}