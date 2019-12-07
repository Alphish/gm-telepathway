/// @function file_read_all_text(path)
/// @param {string} path

var _path = argument0;

if (!file_exists(_path))
	return undefined;

var _buffer = buffer_load(_path);
var _result = buffer_read(_buffer, buffer_string);
buffer_delete(_buffer);

return _result;
