extends CanvasLayer

onready var transition_rect : ColorRect = ColorRect.new()
onready var full_screen : Vector2 = Vector2(360,640)

func _ready() -> void:
	transition_rect.rect_size = full_screen
	transition_rect.color = Color("00000000")
	add_child(transition_rect)

func change_scene_with_animation(scene : PackedScene, container:Node = get_node("/root/Main/MainContainer"))-> void:
	#fade in
	yield(ObjectAnimationRepository._fade_in(transition_rect, 0.5), "completed")
	#change scene
	if container:
		ScreenManager.goto_scene(scene, container)
	else:
		ScreenManager.goto_scene(scene)
	#fade out
	yield(ObjectAnimationRepository._fade_out(transition_rect, 0.5), "completed")
