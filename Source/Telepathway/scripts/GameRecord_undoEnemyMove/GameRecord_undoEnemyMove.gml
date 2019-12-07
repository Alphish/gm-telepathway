/// @function GameRecord_undoEnemyMove(params)
/// @param {string} params

var _params = argument0;

var _original_x = real(string_copy(_params, 1, 2));
var _original_y = real(string_copy(_params, 3, 2));
var _path = string_delete(_params, 1, 4);

var _target_coordinates = __GameRecord_findForePath(_original_x, _original_y, _path);
var _target_x = _target_coordinates[0];
var _target_y = _target_coordinates[1];

//show_debug_message([_target_x, _target_y, "<=", _path, "<=", _original_x, _original_y]);

GameGrid_moveEnemyUnit(_target_x, _target_y, _original_x, _original_y);
with (par_Actor) {
	if (fx == _target_x && fy == _target_y)
		Actor_move(_original_x, _original_y);
}
