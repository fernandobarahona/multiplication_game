extends TextureButton

var _settings_scene = load(GlobalConstants.SCENES_AND_SCRIPTS_PATHS["scene__config_menu"])

func _ready():
	var err = self.connect("pressed",self,"goto_settings")
	if err != OK:
		print("Failure!")

func goto_settings():
	AnimatedSceneManager.change_scene_with_animation(_settings_scene)
