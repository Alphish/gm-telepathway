/// @function json_save(path,map)
/// @param {string} path
/// @param {mapId} map

var _path = argument0;
var _map = argument1;

var _content = json_encode(_map);
file_write_all_text(_path, _content);
