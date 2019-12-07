/// @function __EnemyMove_scheduleWalker(walker,tracker)
/// @param {scheduleItem} walker
/// @param {gridId} tracker

var _walker = argument0;
var _tracker = argument1;

var _x = _walker[0];
var _y = _walker[1];
var _path = _walker[2];

var _walk_length = string_pos("!", _path) - 1;
if (_walk_length < 0)
	_walk_length = string_length(_path);

var _delay = 0;
var _dir;
for (var i = 1; i <= _walk_length; i++) {
	var _dir = real(string_char_at(_path, i));
	_x += global.DIR8X[_dir];
	_y += global.DIR8Y[_dir];
	
	if (_delay + i <= _tracker[# _x, _y])
		_delay = _tracker[# _x, _y] - i + 1;
}

var _x = _walker[0];
var _y = _walker[1];
_tracker[# _x, _y] = _delay;
for (var i = 1; i <= _walk_length; i++) {
	var _dir = real(string_char_at(_path, i));
	_x += global.DIR8X[_dir];
	_y += global.DIR8Y[_dir];
	
	_tracker[# _x, _y] = i + _delay;
}

ds_list_add(pending_actors, _delay, _walker);
