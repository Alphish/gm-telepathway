// EnemyAI_planMoves()

ds_grid_clear(dangers, false);

var _liners_priorities = ds_priority_create();
var _walkers_priorities = ds_priority_create();

// queuing enemies
for (var i = 0; i < width; i++)
for (var j = 0; j < height; j++) {
	var _enemy_unit = GameGrid_getEnemyUnit(i, j);
	
	if (_enemy_unit == EnemyUnit.None || _enemy_unit == EnemyUnit.Player)
		continue;
	
	if (GameState_isDisabled(i, j))
		continue;
	
	var _priority = __EnemyAI_calculatePriority(i, j, "");
	if (is_undefined(_priority))
		continue;
	
	var _is_liner = _enemy_unit == EnemyUnit.Charger || _enemy_unit == EnemyUnit.Gridbane;
	ds_priority_add(_is_liner ? _liners_priorities : _walkers_priorities, [i, j], _priority);
}

// processing line-based enemies
// fluke it, I'm dummying out the line-movers
/*
while (!ds_priority_empty(_liners_priorities)) {
	var _item = ds_priority_delete_min(_liners_priorities);
	var _x = _item[0];
	var _y = _item[1];
	
	var _enemy_unit = GameGrid_getEnemyUnit(i, j);
	switch (_enemy_unit) {
		case EnemyUnit.Charger:
			__EnemyAI_processLine(_x, _y, true);
			break;
		case EnemyUnit.Gridbane:
			__EnemyAI_processLine(_x, _y, false);
			break;
	}
}
*/

// processing step-based enemies
while (!ds_priority_empty(_walkers_priorities)) {
	var _item = ds_priority_delete_min(_walkers_priorities);
	var _x = _item[0];
	var _y = _item[1];
	
	var _attacked = __EnemyAI_processWalk(_x, _y);
	if (_attacked)
		ds_priority_clear(_walkers_priorities);	// if any opponent makes an attack, others don't have to
}

ds_priority_destroy(_liners_priorities);
ds_priority_destroy(_walkers_priorities);
