extends ColorRect

func _ready():
	ObjectAnimationRepository.animate_with_effect(self, "fade_in",0.5)
	pass # Replace with function body.
