/// @function GameGrid_prepareThrow(sourceX,sourceY,targetX,targetY)
/// @param {real} sourceX
/// @param {real} sourceY
/// @param {real} targetX
/// @param {real} targetY

var _source_x = argument0;
var _source_y = argument1;
var _target_x = argument2;
var _target_y = argument3;

// eh, let's just try out each viable grenade cell
// it's dumb, but it works
for (var i = 0; i < 8; i++) {
	var _xoffset = global.DIR8X[i];
	var _yoffset = global.DIR8Y[i];
	for (var j = 1; j <= 2 /*grenade reach*/; j++) {
		var _x = _source_x + _xoffset * j;
		var _y = _source_y + _yoffset * j;
		
		if (GameGrid_getFieldType(_x, _y) == FieldType.Wall || GameGrid_getEnemyUnit(_x, _y) != EnemyUnit.None)
			break;
		
		if (abs(_target_x - _x) <= 1 && abs(_target_y - _y) <= 1)
			return "!" + string(i) + string(j);
	}
}

return "";
