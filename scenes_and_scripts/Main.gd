extends Container

var menu = preload("menu__main/main_menu.tscn")

func _ready():
	SceneManager.gotoScene(menu)
