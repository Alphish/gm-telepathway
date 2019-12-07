/// @function GameState_depletePsi(baseAmount,will,psiInterference)
/// @param {real} baseAmount
/// @param {real} will
/// @param {bool} psiInterference

var _base_amount = argument0;
var _will = argument1;
var _psi_interference = argument2;

var _psi_value = _psi_interference ? 1 : 0;

var _cost = _base_amount + _will + _psi_value;
ctrl_GameState.current_psi -= _cost;
return _cost;
