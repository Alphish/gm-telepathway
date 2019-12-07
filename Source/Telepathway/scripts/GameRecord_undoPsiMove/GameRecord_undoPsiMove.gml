/// @function GameRecord_undoPsiMove(params)
/// @param {string} params

var _params = argument0;

var _psi_spent = real(string_char_at(_params, 1));
var _move_params = string_delete(_params, 1, 1);

ctrl_GameState.current_psi += _psi_spent;

GameRecord_undoEnemyMove(_move_params);
