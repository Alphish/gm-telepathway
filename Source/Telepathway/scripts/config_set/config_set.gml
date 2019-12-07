/// @function config_set(variable, value)

var _variable = argument0;
var _value = argument1;

if (ctrl_Config.data[? _variable] == _value)
	exit;

ctrl_Config.data[? _variable] = _value;
config_save();
