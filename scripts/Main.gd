extends Container

var menu = preload("res://scenes/Menu.tscn")
var matrix_background_scene = preload("res://scenes/Matrix.tscn")

func _ready():
	SceneManager.gotoScene(menu)
