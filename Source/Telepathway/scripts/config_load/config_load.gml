/// @function config_load()

ctrl_Config.data = json_load(CONFIG_PATH);
if (ctrl_Config.data == undefined) {
	file_delete(CONFIG_PATH);						// removing the player-saved config file
	ctrl_Config.data = json_load(CONFIG_PATH);		// loading the default version of the config file
}

// normalize the values
ctrl_Config.data[? CONFIG_BGM_VARIABLE] = is_truthy(config_get(CONFIG_BGM_VARIABLE));
ctrl_Config.data[? CONFIG_SFX_VARIABLE] = is_truthy(config_get(CONFIG_SFX_VARIABLE));
ctrl_Config.data[? CONFIG_FULLSCREEN_VARIABLE] = is_truthy(config_get(CONFIG_FULLSCREEN_VARIABLE));
config_save();

// applying the config

window_set_fullscreen(config_get(CONFIG_FULLSCREEN_VARIABLE));
