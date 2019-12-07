// __EnemyAI_processLine(x,y,allowDiagonal)

var _x = argument0;
var _y = argument1;
var _allow_diagonal = argument2;

var _dir_increment = _allow_diagonal ? 1 : 2;

var _current_priority = __EnemyAI_calculatePriority(_x, _y, "");
var _chosen_dir = 0;
var _chosen_dist = 0;

if (is_undefined(_current_priority))
	exit;

for (var i = 1; i < 8; i += _dir_increment) {
	var _xoffset = global.DIR8X[i];
	var _yoffset = global.DIR8Y[i];
	
	var _spread = 0;
	while (true) {
		var _targetx = _x + _spread * _xoffset;
		var _targety = _y + _spread * _yoffset;
		
		if (GameGrid_getFieldType(_targetx, _targety) != FieldType.Floor)
			break;
		
		var _priority = __EnemyAI_calculatePriority(_x, _y, string_repeat(string(i), _spread));
		if (is_undefined(_priority) || (!is_undefined(_current_priority) && _priority >= _current_priority))
			continue;
		
		_current_priority = _priority;
		_chosen_dir = i;
		_chosen_dist = _spread;
	}
}

for (var i = 0; i <= _chosen_dist; i++) {
	var _xoffset = global.DIR8X[_chosen_dir];
	var _yoffset = global.DIR8Y[_chosen_dir];
	
	var _targetx = _x + _spread * _xoffset;
	var _targety = _y + _spread * _yoffset;
	
	dangers[# _targetx, _targety] = true;
}

ds_list_add(liners_schedule, [_x, _y, string_repeat(_chosen_dir, _chosen_dist)], _current_priority);
