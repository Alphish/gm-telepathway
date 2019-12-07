if (!instance_exists(ctrl_PlayerControl.selected_actor))
	exit;
	
var _enemy_img, _description;
switch (ctrl_PlayerControl.selected_actor.unit) {
	case EnemyUnit.Soldier:
		_enemy_img = 0;
		_description = "Guard (basic unit)";
		break;
	case EnemyUnit.Assassin:
		_enemy_img = 1;
		_description = "Shadow (hovers above gaps)";
		break;
	case EnemyUnit.ESP:
		_enemy_img = 2;
		_description = "Esper (emits field that increases PSI cost)";
		break;
	case EnemyUnit.Gunner:
		_enemy_img = 3;
		_description = "Soldier (shoots from a large distance)";
		break;
	case EnemyUnit.Drone:
		_enemy_img = 4;
		_description = "Drone (hovers, shoots, unreachable by soldiers)";
		break;
	case EnemyUnit.Tank:
		_enemy_img = 5;
		_description = "Tank (shoots in 4 directions, only grenades and other tanks can hit it)"
		break;
	case EnemyUnit.Grenadier:
		_enemy_img = 6;
		_description = "Grenadier (throws a bomb that damages nearby fields; immune to explosion)"
		break;
}

var _frame_color = make_color_rgb(132, 80, 94);

Portrait_draw(x, y, _frame_color, portrait_Enemies, _enemy_img);
if (mouse_in_rectangle(x, y, 128, 128)) {
	draw_tooltip_text(x, y + 64, TooltipPosition.LeftCentered, _description);
}

draw_sprite_3slice_vertical_ext(spr_PortraitFrame, 0, x, y + 128, 512, 32, 64, 32, _frame_color, 1);

// draw inner stuff
draw_sprite_3slice_vertical_ext(spr_PortraitFrame, 1, x, y + 128, 512, 32, 64, 32, _frame_color, 1);

if (instance_exists(ctrl_PlayerControl.selected_actor)) {
	var _enemy = ctrl_PlayerControl.selected_actor.unit;
	
	var _speed = Data_getEnemyUnitProperty(_enemy, EnemyUnitProperty.Speed);
	var _hover = Data_getEnemyUnitProperty(_enemy, EnemyUnitProperty.Hover);
	
	EnemyIcon_draw(
		x + 32, y + 160,
		_hover ? 1 : 0, _hover ? make_color_rgb(0, 128, 255) : c_lime,
		string(_speed) + (_hover ? "H" : "G"),
		"Movement: " + string(_speed) + " cells " + (_hover ? " (can fly over gaps)" : "")
		);
		
	switch (_enemy) {
		case EnemyUnit.Soldier:
			EnemyIcon_draw(x + 32, y + 200, 2, c_red, "ML", "Taser (melee)");
			break;
		case EnemyUnit.Assassin:
			EnemyIcon_draw(x + 32, y + 200, 3, c_red, "ML", "Touch of darkness (melee)");
			break;
		case EnemyUnit.Gunner:
			EnemyIcon_draw(x + 32, y + 200, 4, c_orange, "R4", "Gun (4 cells range)");
			break;
		case EnemyUnit.Drone:
			EnemyIcon_draw(x + 32, y + 200, 5, c_orange, "R2", "Microgun (2 cells range)");
			break;
		case EnemyUnit.Grenadier:
			EnemyIcon_draw(x + 32, y + 200, 6, c_yellow, "S2", "Grenade (2 cells range, damages nearby cells)");
			break;
		case EnemyUnit.Tank:
			EnemyIcon_draw(x + 32, y + 200, 7, c_orange, "LN", "Cannon (unlimited range in 4 basic directions)");
			break;
		case EnemyUnit.ESP:
			EnemyIcon_draw(x + 32, y + 200, 8, c_fuchsia, "??", "Finger poke (melee; can KO only other frail ESPs)");
			break;
	}
	
	var _psi_protection_description;
	if (ctrl_PlayerControl.psi_penalty == 0) {
		_psi_protection_description = "No PSI protection";
	}
	else {
		_psi_protection_description = "PSI protection: " + string(ctrl_PlayerControl.psi_penalty);
		if (ctrl_PlayerControl.selected_will > 0 && ctrl_PlayerControl.selected_interference) {
			_psi_protection_description += " (+" +
				string(ctrl_PlayerControl.selected_will) + " willpower, +1 ESP interference)";
		}
		else if (ctrl_PlayerControl.selected_will > 0) {
			_psi_protection_description += " (+" +
				string(ctrl_PlayerControl.selected_will) + " willpower)";
		}
		else {
			_psi_protection_description += " (+1 ESP interference)";
		}
	}

	EnemyIcon_draw(
		x + 32, y + 240, 11, make_color_rgb(64, 219, 170),
		ctrl_PlayerControl.psi_penalty > 0 ? string(ctrl_PlayerControl.psi_penalty) : "N/A",
		_psi_protection_description
		);
}
