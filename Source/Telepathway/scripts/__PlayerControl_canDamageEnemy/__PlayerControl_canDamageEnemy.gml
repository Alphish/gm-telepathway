/// @function PlayerControl_canDamageEnemy(enemyUnit,targetUnit,direct,allowPlayer)
/// @param {EnemyUnit} enemyUnit
/// @param {EnemyUnit} targetUnit
/// @param {bool} direct
/// @param {bool} allowPlayer

var _enemy_unit = argument0;
var _target_unit = argument1;
var _direct = argument2;
var _allow_player = argument3;

if (_target_unit == EnemyUnit.None)
	return false;
	
if (_target_unit == EnemyUnit.Player)
	return _allow_player;

// anyone can take down feeble ESPs
if (_target_unit == EnemyUnit.ESP)
	return true;

// ESPs cannot harm anyone but each other
if (_enemy_unit == EnemyUnit.ESP)
	return false;

// tanks can only be taken down either by other tanks, or by direct hit from grenadiers
if (_target_unit == EnemyUnit.Tank)
	return _enemy_unit == EnemyUnit.Tank || (_enemy_unit == EnemyUnit.Grenadier && _direct);

// an ordinary mook cannot hit the flying drone
if (_enemy_unit == EnemyUnit.Soldier && _target_unit == EnemyUnit.Drone)
	return false;

// a grenadier isn't affected by grenade's explosion
if (_enemy_unit == EnemyUnit.Grenadier && _target_unit == EnemyUnit.Grenadier && !_direct)
	return false;

// among all the other units, each can hit another
return true;
