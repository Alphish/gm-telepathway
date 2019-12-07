/// @function __Editor_onSave

var _path = get_save_filename_ext("Level|*.json", "level.json", working_directory, "Save level");
if (_path == "")
	exit;

var _level_info = __Editor_createLevelInfo();
json_save(_path, _level_info);
ds_map_destroy(_level_info);
