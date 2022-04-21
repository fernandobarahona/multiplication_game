extends Button

var _menu_scene = load(GlobalConstants.SCENES_AND_SCRIPTS_PATHS["scene__main_menu"])

func _ready():
	var err = self.connect("pressed",self,"goto_menu")
	if err != OK:
		print("Failure!")

func goto_menu():
	Transition.changeSceneLoc(_menu_scene)
