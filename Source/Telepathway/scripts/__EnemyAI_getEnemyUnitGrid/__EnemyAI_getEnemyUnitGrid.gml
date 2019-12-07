/// @function __EnemyAI_getEnemyUnitGrid(enemyUnit)
/// @param {EnemyUnit} enemyUnit

var _enemy_unit = argument0;

switch (_enemy_unit) {
	case EnemyUnit.Soldier:
		return soldier_distance;
	case EnemyUnit.Assassin:
		return assassin_distance;
	case EnemyUnit.Charger:
		return charger_distance;
	case EnemyUnit.Gunner:
		return gunner_distance;
	case EnemyUnit.Drone:
		return drone_distance;
	case EnemyUnit.Grenadier:
		return grenadier_distance;
	case EnemyUnit.Gridbane:
		return gridbane_distance;
	case EnemyUnit.ESP:
		return esp_distance;
	case EnemyUnit.Tank:
		return tank_distance;
}
return undefined;
