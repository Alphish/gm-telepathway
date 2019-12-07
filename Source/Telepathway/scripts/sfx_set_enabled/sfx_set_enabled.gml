/// @function sfx_set_enabled(value)
/// @param {bool} sfx

var _value = argument0;

config_set(CONFIG_SFX_VARIABLE, _value);

if (_value) {
	// no sound effects to re-play
}
else {
	audio_stop_sound(audiogroup_sfx);
}
