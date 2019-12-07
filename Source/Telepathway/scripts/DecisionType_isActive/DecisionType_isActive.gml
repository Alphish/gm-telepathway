/// @function DecisionType_isActive(decision)
/// @param {DecisionType} decision

var _decision = argument0;

switch (_decision) {
	case DecisionType.None:
	case DecisionType.PlainPsi:
	case DecisionType.MovePreview:
	case DecisionType.Gap:
	case DecisionType.MovePsiUnavailable:
	case DecisionType.AttackPreview:
	case DecisionType.Miss:
	case DecisionType.GrenadePreview:
	case DecisionType.GrenadeMiss:
	case DecisionType.GrenadeHit:
		return false;
	case DecisionType.Player:
	case DecisionType.ActorPreview:
	case DecisionType.ActorPreviewPsi:
	case DecisionType.Move:
	case DecisionType.MovePsi:
	case DecisionType.MoveAttack:
	case DecisionType.MoveAttackPsi:
	case DecisionType.Hit:
	case DecisionType.KnockOut:
	case DecisionType.KnockOutPsi:
		return true;
}
