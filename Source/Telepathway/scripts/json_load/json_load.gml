/// @function json_load(path)
/// @param {string} path

var _path = argument0;

var _content = file_read_all_text(_path);
if (is_undefined(_content))
	return undefined;

var _result = json_decode(_content);
if (!ds_exists(_result, ds_type_map))
	return undefined;

return _result;
