/// @function is_truthy(value)
/// @param {any} value

var _value = argument0;

// it may not be truthy in JavaScript sense, but works well enough here
return is_real(_value) && _value > 0;
