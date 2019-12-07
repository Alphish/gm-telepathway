/// @function Data_registerEnemyUnit(enemyUnit,speed,hover,attack,will)
/// @param {EnemyUnit} enemyUnit
/// @param {real} speed
/// @param {bool} hover
/// @param {AttackReach} attack
/// @param {real} will

var _enemy_unit = argument0;
var _speed = argument1;
var _hover = argument2;
var _attack = argument3;
var _will = argument4;

var _unit_properties = ds_map_create();

_unit_properties[? EnemyUnitProperty.Unit] = _enemy_unit;
_unit_properties[? EnemyUnitProperty.Speed] = _speed;
_unit_properties[? EnemyUnitProperty.Hover] = _hover;
_unit_properties[? EnemyUnitProperty.Attack] = _attack;
_unit_properties[? EnemyUnitProperty.Will] = _will;

ds_map_add_map(properties, _enemy_unit, _unit_properties);
