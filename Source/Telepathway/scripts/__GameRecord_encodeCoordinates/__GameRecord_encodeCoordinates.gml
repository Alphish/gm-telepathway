/// @function __GameRecord_encodeCoordinates(x,y)
/// @param {real} x
/// @param {real} y

var _x = argument0;
var _y = argument1;

var _xstr = (_x < 10 ? "0" : "") + string(_x);
var _ystr = (_y < 10 ? "0" : "") + string(_y);

return _xstr + _ystr;
