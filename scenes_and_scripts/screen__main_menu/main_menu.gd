extends CenterContainer

var _game_scene = load(GlobalConstants.SCENES_AND_SCRIPTS_PATHS["scene__game"])
var _config_menu_scene = load(GlobalConstants.SCENES_AND_SCRIPTS_PATHS["scene__config_menu"])
var _login_scene = load(GlobalConstants.SCENES_AND_SCRIPTS_PATHS["scene__login"])

func _ready():
	var _err1 = get_node("MarginContainer/VBoxContainer/GoToGameBtn").connect("pressed",self,"goto_scene",[_game_scene])
	var _err2 = get_node("MarginContainer/VBoxContainer/GoToSettingsBtn").connect("pressed",self,"goto_scene",[_config_menu_scene])
	var _err3 = get_node("MarginContainer/VBoxContainer/GoToLoginBtn").connect("pressed",self,"goto_scene",[_login_scene])

func goto_scene(scene):
	ScreenManager.goto_scene(scene)
