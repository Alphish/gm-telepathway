/// @function EditorButton_create(x,y,width,height,sprite,xoff,yoff,terrain,enemy)
/// @param {real} x
/// @param {real} y
/// @param {real} width
/// @param {real} height
/// @param {spriteId} sprite
/// @param {real} xoff
/// @param {real} yoff
/// @param {FieldType} terrain
/// @param {EnemyUnit} enemy

var _x = argument0;
var _y = argument1;
var _width = argument2;
var _height = argument3;
var _sprite = argument4;
var _xoff = argument5;
var _yoff = argument6;
var _terrain = argument7;
var _enemy = argument8;

with (instance_create_depth(_x, _y, -100, obj_EditorButton)) {
	width = _width;
	height = _height;
	
	sprite = _sprite;
	xoffset = _xoff;
	yoffset = _yoff;
	
	terrain_cursor = _terrain;
	enemy_cursor = _enemy;
}
