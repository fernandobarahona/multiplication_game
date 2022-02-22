extends Container

var menu = preload("menus/Menu.tscn")

func _ready():
	SceneManager.gotoScene(menu)
