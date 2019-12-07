/// @function GameRecord_undoPlayerMove(params)
/// @param {string} params

var _params = argument0;

var _target_x = ctrl_GameGrid.player_x;
var _target_y = ctrl_GameGrid.player_y;
var _path = _params;

var _original_coordinates = __GameRecord_findReversePath(_target_x, _target_y, _path);
var _original_x = _original_coordinates[0];
var _original_y = _original_coordinates[1];

var _actor = obj_Player.id;
GameGrid_moveEnemyUnit(_target_x, _target_y, _original_x, _original_y);
ctrl_GameGrid.player_x = _original_x;
ctrl_GameGrid.player_y = _original_y;
with (_actor) {
	Actor_move(_original_x, _original_y);
}
