var _levels = [
	"level1.json",
	"level2.json",
	"level3.json",
	"level4.json",
	"level5.json",
	"level6.json",
	"level7.json",
	"level8.json",
	"level9.json",
	"level10.json",
	"level11.json",
	"level12.json"
	];
	
for (var i = 0; i < array_length_1d(_levels); i++) {

	with (instance_create_depth(128 + 128 * (i mod 6), 128 + 128 * (i div 6), 0, obj_LevelSelectButton)) {
		level_index = i;
		level_path = _levels[i];
	}
}

with (instance_create_depth(384, room_height - 96, 0, obj_MainMenuButton)) {
	on_click = __LevelSelect_back;
	text = "Back to menu";
}

if (SaveState_getCompletion() >= 12) {
	with (instance_create_depth(384, 400, 0, obj_MainMenuButton)) {
		on_click = __LevelSelect_congrats;
		text = "Ending image";
	}
}

