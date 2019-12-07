
enum AttackReach {
	None = 0,
	
	BasicStrike = 1,
	DroneStrike = AttackReach.BasicStrike << 1,
	GunStrike = AttackReach.DroneStrike << 1,
	GrenadeStrike = AttackReach.GunStrike << 1,
	LineStrike = AttackReach.GrenadeStrike << 1,
	
	IsDirect = AttackReach.LineStrike << 1,
}
