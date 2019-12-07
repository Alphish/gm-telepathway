/// @function bgm_play(bgm)
/// @param {soundId} bgm

var _bgm = argument0;

var _previous_bgm = ctrl_Audio.current_bgm;
if (!is_undefined(_bgm))
	ctrl_Audio.current_bgm = _bgm;

if (_previous_bgm == _bgm && !is_undefined(_previous_bgm) && audio_is_playing(_previous_bgm))
	exit;

if (!is_undefined(_previous_bgm))
	audio_stop_sound(_previous_bgm);

if (!config_get(CONFIG_BGM_VARIABLE))
	exit;

if (!is_undefined(ctrl_Audio.current_bgm))
	audio_play_sound(ctrl_Audio.current_bgm, 0, true);
