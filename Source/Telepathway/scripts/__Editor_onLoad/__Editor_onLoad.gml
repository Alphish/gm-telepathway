/// @function __Editor_onLoad

var _path = get_open_filename_ext("Level|*.json", "level.json", working_directory, "Load level");
if (_path == "")
	exit;

var _level_info = json_load(_path);
__Editor_loadLevelInfo(_level_info);
ds_map_destroy(_level_info);
