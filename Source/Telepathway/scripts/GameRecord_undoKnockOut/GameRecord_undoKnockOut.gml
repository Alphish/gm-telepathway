/// @function GameRecord_undoKnockOut(params)
/// @param {string} params

var _params = argument0;

var _actor_index = real(string_copy(_params, 1, 2));
var _x = real(string_copy(_params, 3, 2));
var _y = real(string_copy(_params, 5, 2));

GameGrid_addUnit(_actor_index, _x, _y);
