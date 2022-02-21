extends CanvasLayer

var gameScene = preload("res://scenes/Game.tscn")
var matrixScene = preload("res://scenes/Matrix.tscn")

func _ready():
	var _err1 = get_node("VBoxContainer/GoToGameBtn").connect("pressed",self,"startGame")
	
func startGame():
	SceneManager.gotoScene(gameScene)
