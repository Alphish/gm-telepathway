/// @function GameState_restorePsi()

var _restored_psi = ctrl_GameState.current_psi < ctrl_GameState.max_psi ? 1 : 0;
ctrl_GameState.current_psi += _restored_psi;
return _restored_psi;
