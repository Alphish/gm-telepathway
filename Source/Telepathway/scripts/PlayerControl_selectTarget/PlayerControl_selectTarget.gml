/// @function PlayerControl_selectTarget(x,y)
/// @param {real} x
/// @param {real} y

var _x = argument0;
var _y = argument1;

with (obj_PlayerAbilitySelector) {
	instance_destroy();
}

selected_x = _x;
selected_y = _y;
selected_actor = !is_undefined(selected_x) && !is_undefined(selected_y) ? ctrl_GameGrid.actors[# selected_x, selected_y] : noone;

PlayerControl_calculatePsiState();

var _selectors_y = 304;
PlayerAbilitySelector_create(32, _selectors_y, 1, PlayerAbility.None, make_color_rgb(181, 117, 199));
PlayerAbilitySelector_create(32, _selectors_y + 80, 2, PlayerAbility.MoveSelf, c_lime);
PlayerAbilitySelector_create(32, _selectors_y + 160, 3, PlayerAbility.Rest, c_white);
PlayerAbilitySelector_create(32, _selectors_y + 240, 4, PlayerAbility.Undo, c_white);

if (is_undefined(selected_x) && is_undefined(selected_y))
	exit;

var _enemy_unit = GameGrid_getEnemyUnit(selected_x, selected_y);
if (_enemy_unit == EnemyUnit.None || _enemy_unit == EnemyUnit.Player)
	exit;

var _y = 304;
PlayerAbilitySelector_create(928, _selectors_y, 5, PlayerAbility.MovePreview, make_color_rgb(181, 117, 199));
PlayerAbilitySelector_create(928, _selectors_y + 80, 6, PlayerAbility.AttackPreview, make_color_rgb(181, 117, 199));
PlayerAbilitySelector_create(928, _selectors_y + 160, 7, PlayerAbility.Psi, make_color_rgb(62, 238, 247));
PlayerAbilitySelector_create(928, _selectors_y + 240, 8, PlayerAbility.KnockOut, make_color_rgb(237, 55, 55));

PlayerControl_selectAbility(max_psi > 0 ? PlayerAbility.Psi : PlayerAbility.MovePreview);

