extends Button

var menuScene = load("res://scenes_and_scripts/menus/mainMenu/MainMenu.tscn")

func _ready():
	var err = self.connect("pressed",self,"goToMenu")
	if err != OK:
		print("Failure!")

func goToMenu():
	SceneManager.gotoScene(menuScene)
