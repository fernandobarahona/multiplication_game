extends Container

var menu = preload("menus/mainMenu/MainMenu.tscn")

func _ready():
	SceneManager.gotoScene(menu)
