var _x = mouse_x - x;
var _y = mouse_y - y;

var _fx = _x div field_size;
var _fy = _y div field_size;

terrain[# _fx, _fy] = ctrl_Editor.terrain_cursor;
enemies[# _fx, _fy] = ctrl_Editor.enemy_cursor;
