/// @function GameRecord_undoTurnEnd(params)
/// @param {string} params

var _params = argument0;

var _psi_restored = real(_params);
ctrl_GameState.current_psi -= _psi_restored;
