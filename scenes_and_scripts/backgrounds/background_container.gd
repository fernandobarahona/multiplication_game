extends CanvasLayer

func _ready():
	var selected_background_path = UserConfig.selected_background[1];
	set_background(selected_background_path)
	var _err = UserConfig.connect("BackgroundChanged",self,"set_background")

func set_background(selected_background_path:String):
	
	var selected_background_scene
	var selected_background_instance
	#delete current background
	if self.get_child_count() != 0:
		self.get_child(0).call_deferred('free')
	#set new background
	selected_background_scene = load(selected_background_path)
	selected_background_instance = selected_background_scene.instance()
	self.add_child(selected_background_instance)
