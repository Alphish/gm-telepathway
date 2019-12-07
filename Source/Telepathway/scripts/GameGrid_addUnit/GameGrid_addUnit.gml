/// @function GameGrid_addUnit(index,x,y)
/// @param {real} index
/// @param {real} x
/// @param {real} y

var _index = argument[0];

var _actor_info = ctrl_GameGrid.actors_info[| _index];

var _x = argument_count < 3 ? _actor_info[? "x"] : argument[1];
var _y = argument_count < 3 ? _actor_info[? "y"] : argument[2];
var _type = _actor_info[? "type"];

var _unit_info = UnitInfo_fromType(_type);
var _enemy_unit = _unit_info[0];
var _object = _unit_info[1];

if (_type == "PLAYER") {
	ctrl_GameGrid.player_x = _x;
	ctrl_GameGrid.player_y = _y;
}

with (instance_create_depth(ctrl_GameGrid.x + FIELD_SIZE * _x, ctrl_GameGrid.y + FIELD_SIZE * _y, -100, _object)) {
	ctrl_GameGrid.enemies[# _x, _y] = _enemy_unit;
	ctrl_GameGrid.actors[# _x, _y] = id;
	
	type = _type;
	unit = _enemy_unit;
	name = _actor_info[? "name"];
	
	actor_index = _index;
	return id;
}
