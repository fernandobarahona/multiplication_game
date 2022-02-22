extends CanvasLayer

func _ready():
	var selected_background_path = GlobalValues.selected_background[1];
	set_background(selected_background_path)
	var _err = GlobalValues.connect("BackgroundChanged",self,"set_background")

func set_background(selected_background_path:String):
	#delete current background
	if self.get_child_count() != 0:
		self.get_child(0).call_deferred('free')
	#set new background
	var selected_background_scene = load(selected_background_path)
	var selected_background_instance = selected_background_scene.instance()
	self.add_child(selected_background_instance)
