enum EnemyUnit {
	None,
	Soldier,
	Assassin,
	Charger,
	Gunner,
	Drone,
	Grenadier,
	Gridbane,
	ESP,
	Tank,
	Player,			// not really an enemy, but I don't feel like doing global search-and-replace now
}

enum EnemyUnitProperty {
	Unit,
	Speed,
	Hover,
	Attack,
	Will,
}
