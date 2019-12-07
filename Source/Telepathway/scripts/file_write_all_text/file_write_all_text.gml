/// @function file_write_all_text(path,content)
/// @param {string} path
/// @param {string} content

var _path = argument0;
var _content = argument1;

var _buffer = buffer_create(string_length(_content), buffer_grow, 1);
buffer_write(_buffer, buffer_string, _content);
buffer_save(_buffer, _path);
buffer_delete(_buffer);
