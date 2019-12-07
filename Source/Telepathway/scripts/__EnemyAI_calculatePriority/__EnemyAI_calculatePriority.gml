// __EnemyAI_calculatePriority(x,y,movement)

var _source_x = argument0;
var _source_y = argument1;
var _movement = argument2;

var _enemy_unit = GameGrid_getEnemyUnit(_source_x, _source_y);
var _grid = __EnemyAI_getEnemyUnitGrid(_enemy_unit);

var _target_x = _source_x;
var _target_y = _source_y;
for (var i = 1; i <= string_length(_movement); i++) {
	var _dir = real(string_char_at(_movement, i));
	_target_x += global.DIR8X[_dir];
	_target_y += global.DIR8Y[_dir];
}

var _target_distance = _grid[# _target_x, _target_y];
var _source_distance = string_length(_movement);
var _angle = point_direction(ctrl_GameGrid.player_x, ctrl_GameGrid.player_y, _source_x, _source_y);

if (is_undefined(_target_distance))
	return undefined;

return 1000 * _target_distance + _source_distance + _angle / 360;
