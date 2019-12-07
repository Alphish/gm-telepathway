enum DecisionType {
	/*
	None,
	PlainPsi,
	MoveSelf,
	Actor,
	ActorPsi,
	ActorWill,
	MovePreview,
	Move,
	MovePsi,
	Gap,
	AttackPreview,
	Miss,
	Hit,
	GrenadePreview,
	GrenadeMiss,
	GrenadeHit,
	*/
	None,
	// player moving
	Player,
	// interferences
	PlainPsi,
	// non-controllable actors
	ActorPreview,
	ActorPreviewPsi,
	// previews
	MovePreview,
	AttackPreview,
	GrenadePreview,
	// move
	Move,
	MovePsi,
	MovePsiUnavailable,
	MoveAttack,
	MoveAttackPsi,
	Gap,
	// attack
	Miss,
	Hit,
	GrenadeMiss,
	GrenadeHit,
	// ko
	KnockOut,
	KnockOutPsi,
}