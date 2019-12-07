/// @function bgm_set_enabled(value)
/// @param {bool} value

var _value = argument0;

config_set(CONFIG_BGM_VARIABLE, _value);

if (_value) {
	bgm_play(ctrl_Audio.current_bgm);
}
else {
	bgm_stop();
}
