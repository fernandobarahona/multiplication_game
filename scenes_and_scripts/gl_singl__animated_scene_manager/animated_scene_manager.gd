extends CanvasLayer

#onready var transition_tween : Tween = Tween.new()
onready var transition_rect : ColorRect = ColorRect.new()
onready var full_screen : Vector2 = Vector2(360,640)

func _ready() -> void:
	#add tween
	#add_child(transition_tween)
	transition_rect.rect_size = full_screen
	transition_rect.color = Color("00000000")
	add_child(transition_rect)

func change_scene_with_animation(scene : PackedScene, animation_type : String, container:Node = get_node("/root/Main/MainContainer")) -> void:
	match animation_type:
		"fade_in_out":
			fade_in_out(scene, container)
	pass

func fade_in_out(scene : PackedScene, container:Node):
	#fade in
	yield(ObjectAnimationRepository.animate_with_effect(transition_rect, "fade_in", 0.5), "completed")
	#change scene
	if container:
		ScreenManager.goto_scene(scene, container)
	else:
		ScreenManager.goto_scene(scene)
	#fade out
	yield(ObjectAnimationRepository.animate_with_effect(transition_rect, "fade_out", 0.5), "completed")
