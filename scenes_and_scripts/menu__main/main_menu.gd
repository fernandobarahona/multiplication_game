extends CanvasLayer

var gameScene = load(GlobalValues.SCENES_AND_SCRIPTS_PATHS["scene__game"])
var configMenuScene = load(GlobalValues.SCENES_AND_SCRIPTS_PATHS["scene__config_menu"])
var loginScene = load(GlobalValues.SCENES_AND_SCRIPTS_PATHS["scene__login"])

func _ready():
	var _err1 = get_node("VBoxContainer/GoToGameBtn").connect("pressed",self,"goToScene",[gameScene])
	var _err2 = get_node("VBoxContainer/GoToSettingsBtn").connect("pressed",self,"goToScene",[configMenuScene])
	var _err3 = get_node("VBoxContainer/GoToLoginBtn").connect("pressed",self,"goToScene",[loginScene])
	
func goToScene(scene):
	SceneManager.gotoScene(scene)
