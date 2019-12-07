/// @function Data_getEnemyUnitProperty(enemyUnit,property)
/// @param {EnemyUnit} enemyUnit
/// @param {EnemyUnitProperty} property

var _enemy_unit = argument0;
var _property = argument1;

return ds_map_find_value(data_EnemyUnit.properties[? _enemy_unit], _property);