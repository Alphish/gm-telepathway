draw_sprite(bg_MainMenu, 0, 0, 0);

var _completion = clamp(0, SaveState_getCompletion(), 12);

var _pursuer_counts = [0, 1, 1, 2, 2, 3, 3, 4, 4, 4, 5, 6, 7];
var _count = _pursuer_counts[_completion];

if (_count > 0)
	draw_sprite_part(spr_Pursuers, 0, 0, 0, 100 * _count, 200, room_width - 50 - _count * 100,room_height - 556);
