extends CanvasLayer

var gameScene = preload("res://scenes_and_scripts/game/Game.tscn")
var configMenuScene = preload("res://scenes_and_scripts/menus/ConfigMenu.tscn")

func _ready():
	var _err1 = get_node("VBoxContainer/GoToGameBtn").connect("pressed",self,"startGame")
	var _err2 = get_node("VBoxContainer/GoToSettingsBtn").connect("pressed",self,"goToSettings")
	
func startGame():
	SceneManager.gotoScene(gameScene)
func goToSettings():
	SceneManager.gotoScene(configMenuScene)
