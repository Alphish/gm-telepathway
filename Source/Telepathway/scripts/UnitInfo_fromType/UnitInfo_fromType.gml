/// @function UnitInfo_fromType(type)
/// @param {string} type

var _type = argument0;

switch (string_upper(_type)) {
	case "PLAYER":
		return [EnemyUnit.Player, obj_Player];
	case "MOOK":
		return [EnemyUnit.Soldier, obj_Soldier];
	case "HOVER":
		return [EnemyUnit.Assassin, obj_Assassin];
	case "GUN":
		return [EnemyUnit.Gunner, obj_Gunner];
	case "DRONE":
		return [EnemyUnit.Drone, obj_Drone];
	case "BOMB":
		return [EnemyUnit.Grenadier, obj_Grenadier];
	case "TANK":
		return [EnemyUnit.Tank, obj_Tank];
	case "ESP":
		return [EnemyUnit.ESP, obj_ESP];
}
