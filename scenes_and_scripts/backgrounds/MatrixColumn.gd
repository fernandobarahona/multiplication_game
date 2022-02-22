extends Control

var fadingChar = preload("MatrixFadingChar.tscn")

var x_position = 0
var y_positions = [20,80,140,200,260,320,380]
var TIME_IN_SEC = 0.3
var FRAME_PER_SECOND = 60
var time = TIME_IN_SEC * FRAME_PER_SECOND
var position_index = 0

func init(y_pos_array:Array, x_pos:int):
	x_position = x_pos
	y_positions = y_pos_array
	
func _ready():
	pass

func _physics_process(_delta):
	if time > 0:
		time -= 1
	else:
		var new_label = fadingChar.instance()
		new_label.init(["0","1"], y_positions[position_index], x_position)
		add_child(new_label)
		
		
		if position_index < y_positions.size() - 1:
			position_index += 1
		else:
			position_index = 0
		time = TIME_IN_SEC * FRAME_PER_SECOND
	
