extends MarginContainer

class_name MainMenu

var _game_scene = load(GlobalConstants.SCENES_AND_SCRIPTS_PATHS["scene__game"])
var _config_menu_scene = load(GlobalConstants.SCENES_AND_SCRIPTS_PATHS["scene__config_menu"])
var _login_scene = load(GlobalConstants.SCENES_AND_SCRIPTS_PATHS["scene__login"])

func _ready():
	var _err1 = get_node("VBoxContainer/GoToGameBtn").connect("pressed",self,"goToScene",[_game_scene])
	var _err2 = get_node("VBoxContainer/GoToSettingsBtn").connect("pressed",self,"goToScene",[_config_menu_scene])
	var _err3 = get_node("VBoxContainer/GoToLoginBtn").connect("pressed",self,"goToScene",[_login_scene])

func goToScene(scene):
	ScreenManager.goto_scene(scene)
