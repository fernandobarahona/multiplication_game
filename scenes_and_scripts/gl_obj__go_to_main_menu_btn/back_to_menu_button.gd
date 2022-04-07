extends Button

var menuScene = load(GlobalValues.SCENES_AND_SCRIPTS_PATHS["scene__main_menu"])

func _ready():
	var err = self.connect("pressed",self,"goToMenu")
	if err != OK:
		print("Failure!")

func goToMenu():
	SceneManager.gotoScene(menuScene)
