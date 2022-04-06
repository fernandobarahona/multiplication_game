extends CanvasLayer

var gameScene = preload("res://scenes_and_scripts/game/Game.tscn")
var configMenuScene = preload("res://scenes_and_scripts/menus/configMenu/ConfigMenu.tscn")
var loginScene = preload("res://scenes_and_scripts/login/Login.tscn")

func _ready():
	var _err1 = get_node("VBoxContainer/GoToGameBtn").connect("pressed",self,"goToScene",[gameScene])
	var _err2 = get_node("VBoxContainer/GoToSettingsBtn").connect("pressed",self,"goToScene",[configMenuScene])
	var _err3 = get_node("VBoxContainer/GoToLoginBtn").connect("pressed",self,"goToScene",[loginScene])
	
func goToScene(scene):
	SceneManager.gotoScene(scene)
