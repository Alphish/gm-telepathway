/// @function __Edutor_createLevelInfo()

var _level_info = ds_map_create();

with (ctrl_EditorGrid) {
	_level_info[? "width"] = grid_width;
	_level_info[? "height"] = grid_height;
	
	var _terrain_str = "";
	for (var j = 0; j < grid_height; j++)
	for (var i = 0; i < grid_width; i++) {
		switch (terrain[# i, j]) {
			case FieldType.Floor:
				_terrain_str += ".";
				break;
			case FieldType.Gap:
				_terrain_str  += "0";
				break;
			case FieldType.Wall:
				_terrain_str += "#";
				break;
		}
	}
	_level_info[? "terrain"] = _terrain_str;
	
	var _actors_info = ds_list_create();
	for (var i = 0; i < grid_width; i++)
	for (var j = 0; j < grid_height; j++) {
		if (enemies[# i, j] == EnemyUnit.None)
			continue;
		
		var _actor_info = undefined;
		switch (enemies[# i, j]) {
			case EnemyUnit.Player:
				_actor_info = __Editor_makeActorInfo(i, j, "PLAYER", "Veria");
				break;
			case EnemyUnit.Soldier:
				_actor_info = __Editor_makeActorInfo(i, j, "MOOK", "Guard");
				break;
			case EnemyUnit.Assassin:
				_actor_info = __Editor_makeActorInfo(i, j, "HOVER", "Shadow");
				break;
			case EnemyUnit.Gunner:
				_actor_info = __Editor_makeActorInfo(i, j, "GUN", "Soldier");
				break;
			case EnemyUnit.Drone:
				_actor_info = __Editor_makeActorInfo(i, j, "DRONE", "Drone");
				break;
			case EnemyUnit.Grenadier:
				_actor_info = __Editor_makeActorInfo(i, j, "BOMB", "Grenadier");
				break;
			case EnemyUnit.Tank:
				_actor_info = __Editor_makeActorInfo(i, j, "TANK", "Tank");
				break;
			case EnemyUnit.ESP:
				_actor_info = __Editor_makeActorInfo(i, j, "ESP", "ESP");
				break;
			/*
			case EnemyUnit.Gridbane:
				_actor_info = __Editor_makeActorInfo(i, j, "ROOK", "Linear slayer");
				break;
			case EnemyUnit.Charger:
				_actor_info = __Editor_makeActorInfo(i, j, "QUEEN", "Razor saucer");
				break;
			*/
		}
		ds_list_add(_actors_info, _actor_info);
		ds_list_mark_as_map(_actors_info, ds_list_size(_actors_info)-1);
	}
	ds_map_add_list(_level_info, "actors", _actors_info);
}

return _level_info;
