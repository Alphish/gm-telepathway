/// @function GameFlow_endTurn()

var _restored_psi = GameState_restorePsi();
GameRecord_addTurnEnd(_restored_psi);

ds_list_add(ctrl_GameRecord.previous_turns, ctrl_GameRecord.current_turn);
ctrl_GameRecord.current_turn = "";

GameFlow_beginTurn();
