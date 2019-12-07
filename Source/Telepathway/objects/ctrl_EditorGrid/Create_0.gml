event_inherited();

on_click = __EditorGrid_onClick;

terrain = ds_grid_create(1, 1);
ds_grid_clear(terrain, FieldType.Floor);

enemies = ds_grid_create(1, 1);
ds_grid_clear(enemies, EnemyUnit.None);

field_size = 32;

__EditorGrid_resize(10, 10);
