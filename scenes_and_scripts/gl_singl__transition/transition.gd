extends CanvasLayer

onready var transitionRect : ColorRect = ColorRect.new()
onready var transitionTween : Tween = $TransitionTween

func changeSceneLoc(scene : PackedScene) -> void:
	layer = 1
	
	transitionRect.rect_size = Vector2(360,640)
	add_child(transitionRect)
	print(transitionRect.rect_size)
	
	#fade in
	var _fadeIn = transitionTween.interpolate_property(transitionRect, 
										"color", Color("00000000"),
										Color("000000"),0.5)
	var _fadeInStart = transitionTween.start()
	yield(transitionTween, "tween_completed")
	
	#change scene
	ScreenManager.goto_scene(scene)
	
	#fade out
	var _fadeOut = transitionTween.interpolate_property(transitionRect, 
										"color", Color("000000"),
										Color("00000000"),0.5)
	var _fadeOutEnd = transitionTween.start()
	yield(transitionTween, "tween_completed")
	layer = 0
	remove_child(transitionRect)

func _ready():
	layer = 0
