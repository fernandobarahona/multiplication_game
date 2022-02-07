extends CenterContainer

var gameScene = preload("res://scenes/Game.tscn")

func _ready():
	var err = get_node("Boton Menu").connect("pressed",self,"startGame")
	if err != OK:
		print("Failure!")

func startGame():
	SceneManager.gotoScene(gameScene)
