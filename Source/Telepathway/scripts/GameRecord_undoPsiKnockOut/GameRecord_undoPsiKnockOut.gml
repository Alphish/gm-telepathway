/// @function GameRecord_undoPsiKnockOut(params)
/// @param {string} params

var _params = argument0;

var _psi_spent = real(string_char_at(_params, 1));
ctrl_GameState.current_psi += _psi_spent;
