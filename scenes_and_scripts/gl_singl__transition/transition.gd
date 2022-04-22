extends CanvasLayer

onready var transition_tween : Tween = Tween.new()
onready var transition_rect : ColorRect = ColorRect.new()
onready var full_screen : Vector2 = Vector2(360,640)

func change_scene_loc(scene : PackedScene) -> void:
	self.layer = 1
	
	#add tween
	add_child(transition_tween)
	
	#add colorRect
	transition_rect.rect_size = full_screen
	add_child(transition_rect)
	
	#fade in
	var _fadeIn = transition_tween.interpolate_property(transition_rect, 
										"color", Color("00000000"),
										Color("000000"),0.5)
	var _fadeInStart = transition_tween.start()
	yield(transition_tween, "tween_completed")
	
	#change scene
	ScreenManager.goto_scene(scene)
	
	#fade out
	var _fadeOut = transition_tween.interpolate_property(transition_rect, 
										"color", Color("000000"),
										Color("00000000"),0.5)
	var _fadeOutEnd = transition_tween.start()
	yield(transition_tween, "tween_completed")
	
	# remove transition's children
	remove_child(transition_rect)
	remove_child(transition_tween)

	self.layer = 0
	
func _ready():
	self.layer = 0
