/// @function fullscreen_toggle()

var _value = !window_get_fullscreen();

config_set(CONFIG_FULLSCREEN_VARIABLE, _value);
window_set_fullscreen(_value);
