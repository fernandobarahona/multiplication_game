extends Button

var menuScene = load("res://scenes/Menu.tscn")

func _ready():
	var err = self.connect("pressed",self,"goToMenu")
	if err != OK:
		print("Failure!")

func goToMenu():
	SceneManager.gotoScene(menuScene)
