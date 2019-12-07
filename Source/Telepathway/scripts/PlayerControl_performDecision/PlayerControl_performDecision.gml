/// @function PlayerControl_performDecision(x,y)
/// @param {real} x
/// @param {real} y

var _x = argument0;
var _y = argument1;

var _decision = decision_grid[# _x, _y];

switch (selected_ability) {
	case PlayerAbility.None:
	case PlayerAbility.MovePreview:
	case PlayerAbility.AttackPreview:
		if (_decision == DecisionType.Player)
			PlayerControl_selectAbility(PlayerAbility.MoveSelf);
		else
			PlayerControl_selectTarget(_x, _y);
		break;
	case PlayerAbility.MoveSelf:
		if (_decision == DecisionType.Player) {
			GameState_rest();
		}
		else {
			GameRecord_addPlayerMove(movement_path[# _x, _y]);

			var _actor = obj_Player.id;
			GameGrid_moveEnemyUnit(ctrl_GameGrid.player_x, ctrl_GameGrid.player_y, _x, _y);
			ctrl_GameGrid.player_x = _x;
			ctrl_GameGrid.player_y = _y;
			with (_actor) {
				Actor_walk(other.movement_path[# _x, _y]);
			}
		}
		
		GameState_depletePlayerAction(_decision == DecisionType.Player);
		GameFlow_poke();
		break;
		/*
	case PlayerAbility.Move:
		var _psi_interference = _source_interference || _enemy_interference || _decision_interference;
		var _cost = GameState_depletePsi(1, _selected_enemy, _psi_interference);

		GameRecord_addPsiMove(_cost, selected_x, selected_y, movement_path[# _x, _y]);
	
		GameGrid_moveEnemyUnit(selected_x, selected_y, _x, _y);
		with (par_Actor) {
			if (fx == other.selected_x && fy == other.selected_y)
				Actor_walk(other.movement_path[# _x, _y]);
		}
		GameState_disableUnit(_x, _y);
		GameState_depletePlayerAction();
		GameFlow_poke();
		break;
	case PlayerAbility.Attack:
		if (!is_attack) {
			is_attack = true;
			target_path = movement_path[# _x, _y];
			target_x = _x;
			target_y = _y;
			PlayerControl_populateDecisions();
		}
		else {
			var _psi_interference = _source_interference || _enemy_interference || _destination_interference;
			var _cost = GameState_depletePsi(2, _selected_enemy, _psi_interference);
			var _path = target_path + GameGrid_prepareAttack(target_x, target_y, _x, _y);
			GameRecord_addPsiMove(_cost, selected_x, selected_y, _path);
	
			GameGrid_moveEnemyUnit(selected_x, selected_y, target_x, target_y);
			with (par_Actor) {
				if (fx == other.selected_x && fy == other.selected_y) {
					Actor_walk(_path);
				}
			}
			GameState_disableUnit(target_x, target_y);
			GameState_depletePlayerAction();
			GameFlow_poke();
		}
		break;
		*/
	case PlayerAbility.Psi:
		if (!is_attack) {
			is_attack = true;
			target_path = movement_path[# _x, _y];
			target_x = _x;
			target_y = _y;
			
			// if it's Move/MovePsi, perform the subsequent move decision immediately
			// otherwise await player further decisions
			if (_decision == DecisionType.MoveAttack || _decision == DecisionType.MoveAttackPsi) {
				PlayerControl_populateDecisions();
				break;
			}
		}
		
		var _is_hit = _decision == DecisionType.Hit;
		
		var _cost = GameState_depletePsi(_is_hit ? 2 : 1, selected_will, selected_interference || psi_interference[# target_x, target_y]);
		GameGrid_moveEnemyUnit(selected_x, selected_y, target_x, target_y);
		var _path = target_path + (_is_hit ? GameGrid_prepareAttack(target_x, target_y, _x, _y) : "");
		GameRecord_addPsiMove(_cost, selected_x, selected_y, _path);
		
		//show_debug_message([selected_x, selected_y, "=>", _path, "=>", target_x, target_y]);
	
		with (par_Actor) {
			if (fx == other.selected_x && fy == other.selected_y) {
				Actor_walk(_path);
			}
		}
		GameState_disableUnit(target_x, target_y);
		GameState_depletePlayerAction();
		GameFlow_poke();
		break;
}
