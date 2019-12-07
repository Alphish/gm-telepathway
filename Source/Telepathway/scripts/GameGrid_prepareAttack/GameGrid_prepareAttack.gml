/// @function GameGrid_prepareAttack(sourceX,sourceY,targetX,targetY)
/// @param {real} sourceX
/// @param {real} sourceY
/// @param {real} targetX
/// @param {real} targetY

var _source_x = argument0;
var _source_y = argument1;
var _target_x = argument2;
var _target_y = argument3;

var _xoffset = sign(_target_x - _source_x);
var _yoffset = sign(_target_y - _source_y);

var _diry = global.DIR8GRID[1 + _yoffset];
var _dir = _diry[1 + _xoffset];
var _dist = max(abs(_target_x - _source_x), abs(_target_y - _source_y));

for (var i = 1; i < _dist; i++) {
	var _x = _source_x + _xoffset * i;
	var _y = _source_y + _yoffset * i;
	
	if (GameGrid_getFieldType(_x, _y) == FieldType.Wall || GameGrid_getEnemyUnit(_x, _y) != EnemyUnit.None)
		return "";
}

return "!" + string(_dir) + string(_dist);
