/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch (on_click) {
	case __MainMenu_bgmClick:
		text = "Music " + (config_get(CONFIG_BGM_VARIABLE) ? "(ON)" : "(OFF)");
		break;
	case __MainMenu_sfxClick:
		text = "SFX " + (config_get(CONFIG_SFX_VARIABLE) ? "(ON)" : "(OFF)");
		break;
	case __MainMenu_fullscreenClick:
		text = "Fullscreen " + (config_get(CONFIG_FULLSCREEN_VARIABLE) ? "(ON)" : "(OFF)");
		break;
}
