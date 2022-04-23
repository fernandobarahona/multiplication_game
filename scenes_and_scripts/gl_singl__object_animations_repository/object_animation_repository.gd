extends Node

onready var transition_tween : Tween = Tween.new()

func _ready() -> void:
	add_child(transition_tween)

func animate_with_effect(object_to_animate:Node, _effect : String, duration:float):
	print(duration)
	match _effect:
		"fade_in":
			return _fade_in(object_to_animate, duration)
		"fade_out":
			return _fade_out(object_to_animate, duration)
		"fade_in_out":
			return _fade_in_out(object_to_animate, duration)
	pass
	
func _fade_in_out(obj:Node, duration:float):
	_fade_in(obj, duration/2)
	_fade_out(obj, duration/2)
	
func _fade_out(obj:Node, duration:float):
	var _fadeIn = transition_tween.interpolate_property(obj, 
										"color", Color("000000"),
										Color("00000000"),duration)
	var _fadeInStart = transition_tween.start()
	yield(transition_tween, "tween_completed")

func _fade_in(obj:Node, duration:float):
	var _fadeIn = transition_tween.interpolate_property(obj, 
										"color", Color("00000000"),
										Color("000000"),duration)
	var _fadeInStart = transition_tween.start()
	yield(transition_tween, "tween_completed")
