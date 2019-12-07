/// @function GameRecord_addTurnEnd(psiRestored)
/// @param {real} psiRestored

var _psi_restored = argument0;

GameRecord_add("TE" + string(_psi_restored));
