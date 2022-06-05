extends Control

var fadingChar = preload("matrix_bk__fading_char.tscn")

var x_position := 0
var y_positions := []
var chars := []
var chars_not_in_screen := []
var posibles_chars:Array
var chars_font: Resource
var column_width:= 0

func init(y_pos_array:Array, x_pos:int, col_width: int, chars_fnt:Resource, pos_chars:Array, timer:Timer):
	chars_font = chars_fnt
	column_width = col_width
	var _err = timer.connect("timeout",self,"_put_char_to_scene_tree")
	posibles_chars = pos_chars
	x_position = x_pos
	y_positions = y_pos_array
	
func _ready():
	self.rect_size.x = column_width
	self.rect_position.x = x_position
	for y_position in y_positions:
		var new_char = fadingChar.instance()
		var character_to_print = posibles_chars[randi()%posibles_chars.size()] 
		new_char.init(character_to_print, y_position, chars_font)
		chars.append(new_char)
		chars_not_in_screen.append(new_char)
		
	
func _put_char_to_scene_tree():
	if chars_not_in_screen.size() > 0 :
		$".".add_child(chars_not_in_screen[0])
		chars_not_in_screen.remove(0)

func _tilt_chars_to_char(char_to_tilt):
	for ch in chars:
		if randi() % 2 == 1:
			ch.tilt_to_character(char_to_tilt)
	
