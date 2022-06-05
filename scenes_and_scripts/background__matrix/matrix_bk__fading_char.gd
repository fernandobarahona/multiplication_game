extends Control

var char_font 
var char_to_print:= '0'
var y_position = 0

func init(character_to_print : String, y_pos:int, font):
	char_font = font
	char_to_print = character_to_print
	y_position = y_pos 

func _ready():
	self.set_position(Vector2(0,y_position))
	self.add_font_override("font",char_font)
	self.text = char_to_print

func tilt_to_character(character:String) -> void:
	self.text = character
	$tiltingTimer.connect('timeout',self,"tilting_effect")
	$tiltingTimer.start()
	
func tilting_effect():
	self.text = char_to_print
	$tiltingTimer.stop()
	$tiltingTimer.disconnect('timeout',self,"tilting_effect")
	
