extends CanvasLayer

func _ready():
	var selected_background_path = UserConfig.selected_background[1];
	#var selected_background_path = "res://scenes_and_scripts/background__matrix/matrix_background.tscn"
	set_background(selected_background_path)
	var _err = UserConfig.connect("BackgroundChanged",self,"set_background")

func set_background(selected_background_path:String):
	BackgroundManager.goto_scene(load(selected_background_path), get_node("/root/Main/BackgroundContainer"))
