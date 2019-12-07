/// @function __GameRecord_findReversePath(x,y,path)
/// @param {real} x
/// @param {real} y
/// @param {string} path

var _x = argument0;
var _y = argument1;
var _path = argument2;

for (var i = 1; i <= string_length(_path); i++) {
	var _char = string_char_at(_path, i);
	if (_char == "!")
		break;
	
	var _dir = real(_char);
	_x -= global.DIR8X[_dir];
	_y -= global.DIR8Y[_dir];
}

return [_x, _y];
