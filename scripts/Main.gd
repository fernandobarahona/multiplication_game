extends Container

var menu = preload("res://scenes/Menu.tscn")
var menuInstance

func _ready():
	SceneManager.gotoScene(menu)
	
	
