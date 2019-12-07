instance_create_depth(768 / 2 - 320 / 2, 768 / 2 - 320 / 2, 0, ctrl_EditorGrid);
instance_create_depth(768, 0, 0, obj_EditorButtonPanel);

terrain_cursor = FieldType.Floor;
enemy_cursor = EnemyUnit.None;

EditorButton_create(800, 32, 32, 48, spr_Floor, 0, 0, FieldType.Floor, EnemyUnit.None);
EditorButton_create(864, 32, 32, 48, spr_Wall, 0, 16, FieldType.Wall, EnemyUnit.None);
EditorButton_create(928, 40, 32, 32, spr_Gap, 0, 0, FieldType.Gap, EnemyUnit.None);

EditorButton_create(864, 112, 32, 32, spr_Player, 16, 32, FieldType.Floor, EnemyUnit.Player);

EditorButton_create(800, 176, 32, 32, spr_Soldier, 16, 32, FieldType.Floor, EnemyUnit.Soldier);
EditorButton_create(864, 176, 32, 32, spr_Gunner, 16, 32, FieldType.Floor, EnemyUnit.Gunner);
EditorButton_create(928, 176, 32, 32, spr_Grenadier, 16, 32, FieldType.Floor, EnemyUnit.Grenadier);
EditorButton_create(800, 240, 32, 32, spr_Assassin, 16, 32, FieldType.Floor, EnemyUnit.Assassin);
EditorButton_create(864, 240, 32, 32, spr_Drone, 16, 32, FieldType.Floor, EnemyUnit.Drone);
EditorButton_create(928, 240, 32, 32, spr_Tank, 16, 32, FieldType.Floor, EnemyUnit.Tank);
EditorButton_create(864, 304, 32, 32, spr_ESP, 16, 32, FieldType.Floor, EnemyUnit.ESP);

SpriteButton_create(816, 576, -100, spr_EditorActions, 0, __Editor_onSave);
SpriteButton_create(912, 576, -100, spr_EditorActions, 1, __Editor_onLoad);
SpriteButton_create(816, 672, -100, spr_EditorActions, 2, __Editor_onTest);
SpriteButton_create(912, 672, -100, spr_EditorActions, 3, __Editor_onExit);

if (global.is_test) {
	__Editor_loadLevelInfo(global.level_info);
	ds_map_destroy(global.level_info);
}
