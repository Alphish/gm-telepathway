/// @function PlayerControl_drawDecisionType(x,y,decision,hover)
/// @param {real} x
/// @param {real} y
/// @param {DecisionType} decision
/// @param {bool} hover

var _x = argument0;
var _y = argument1;

var _view_x = ctrl_GameGrid.x + ctrl_GameGrid.field_size * _x;
var _view_y = ctrl_GameGrid.y + ctrl_GameGrid.field_size * _y;

/*
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(_view_x + 16, _view_y + 16, movement_path[# _x, _y]);
*/

var _decision = decision_grid[# _x, _y];
if (_decision == DecisionType.None)
	exit;

var _hover = _x == hover_x && _y == hover_y;

var _outline_alpha = _hover ? 0.5 : 0.3;
var _inner_alpha = _hover ? 0.3 : 0.1;

switch (_decision) {
	// player moving
	case DecisionType.Player:
		draw_set_color(c_white);
		break;
	// interferences
	case DecisionType.PlainPsi:
		draw_set_color(c_purple);
		break;
	// non-controllable actors
	case DecisionType.ActorPreview:
		draw_set_color(c_black);
		break;
	case DecisionType.ActorPreviewPsi:
		draw_set_color(c_blue);
		break;
	// previews
	// move
	case DecisionType.MovePreview:
		draw_set_color(make_color_rgb(0, 64, 0));
		break;
	case DecisionType.Move:
		draw_set_color(c_lime);
		break;
	case DecisionType.MovePsiUnavailable:
		draw_set_color(c_teal);
		break;
	case DecisionType.MovePsi:
		draw_set_color(c_aqua);
		break;
	case DecisionType.MoveAttack:
		draw_set_color(c_yellow);
		break;
	case DecisionType.MoveAttackPsi:
		draw_set_color(c_orange);
		break;
	case DecisionType.Gap:
		draw_set_color(c_gray);
		break;
	// attack
	case DecisionType.AttackPreview:
	case DecisionType.Miss:
		draw_set_color(make_color_rgb(64, 0, 0));
		break;
	case DecisionType.Hit:
		draw_set_color(c_red);
		break;
	case DecisionType.GrenadeMiss:
	case DecisionType.GrenadePreview:
		draw_set_color(make_color_rgb(64, 32, 0));
		break;
	case DecisionType.GrenadeHit:
		draw_set_color(c_orange);
		break;
	// ko
	case DecisionType.KnockOut:
		draw_set_color(c_red);
		break;
	case DecisionType.KnockOutPsi:
		draw_set_color(c_fuchsia);
		break;
	/*
	case DecisionType.MoveSelf:
		draw_set_color(c_white);
		break;
	case DecisionType.Actor:
		draw_set_color(c_aqua);
		break;
	case DecisionType.ActorPsi:
		draw_set_color(c_blue);
		break;
	case DecisionType.ActorWill:
		draw_set_color(c_purple);
		break;
	case DecisionType.PlainPsi:
		draw_set_color(c_navy);
		break;
	case DecisionType.MovePreview:
	case DecisionType.Move:
		draw_set_color(c_lime);
		break;
	case DecisionType.MovePsi:
		draw_set_color(c_blue);
		break;
	case DecisionType.Gap:
		draw_set_color(c_gray);
		break;
	case DecisionType.Miss:
		draw_set_color(c_maroon);
		break;
	case DecisionType.AttackPreview:
	case DecisionType.Hit:
		draw_set_color(c_red);
		break;
	case DecisionType.GrenadeMiss:
		draw_set_color(make_color_rgb(128, 64, 0));
		break;
	case DecisionType.GrenadePreview:
	case DecisionType.GrenadeHit:
		draw_set_color(c_orange);
		break;
	*/
}

var _view_x = ctrl_GameGrid.x + ctrl_GameGrid.field_size * _x;
var _view_y = ctrl_GameGrid.y + ctrl_GameGrid.field_size * _y;

draw_set_alpha(_inner_alpha);
draw_rectangle(_view_x + 1, _view_y + 1, _view_x + ctrl_GameGrid.field_size - 2, _view_y + ctrl_GameGrid.field_size - 2, false);
draw_set_alpha(_outline_alpha);
draw_rectangle(_view_x + 1, _view_y + 1, _view_x + ctrl_GameGrid.field_size - 2, _view_y + ctrl_GameGrid.field_size - 2, true);

draw_set_color(c_white);
draw_set_alpha(1);
