/// @function sfx_play(sfx)
/// @param {soundId} sfx

var _sfx = argument0;

if (!config_get(CONFIG_SFX_VARIABLE))
	exit;

audio_play_sound(_sfx, 0, false);
