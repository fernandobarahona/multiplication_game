extends ColorRect

func _ready():
	var transparentColor = Color("00000000")
	self.color = transparentColor

func animateAnswer(answer:String):
	var WrongAnswerColor = Color("77fb0505")
	
	match answer:
		"right":
			pass
		"wrong":
			return ObjectAnimationRepository.fade_in_out(self,.4, WrongAnswerColor)

