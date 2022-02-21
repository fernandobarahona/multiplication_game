extends Control

var fallingChar = preload("res://scenes/MatrixFadingChar.tscn")
var matrix_column = preload("res://scenes/MatrixColumn.tscn")
var matrix_font = preload("res://assets/themes/fonts/default_dynamicfont_bluetheme.tres")
var matrix_color = Color(0,255,0,1)

var chars_to_print = ["1","0"]
var posibles_chars = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "X", "=", ]

var x_positions = []
var y_positions = []
var back_to_menu_button_scene = preload("res://scenes/BackToMenuButton.tscn")

var TIME_IN_SEC = 0.5
var FRAME_PER_SECOND = 60
var time_for_columns = TIME_IN_SEC * FRAME_PER_SECOND 
var position_index = 0

func _ready():
	calculate_font_positions()
	create_columns()

func calculate_font_positions():
	#CALCULATE X(COLUMN) FONT POSITION
	var font_width = 0
	for ii in posibles_chars:
		if matrix_font.get_char_size(ord(str(ii)))[0] > font_width:
			font_width = matrix_font.get_char_size(ord(str(ii)))[0]
	var screen_width = get_viewport().size.x
	var letters_x_quantity = ceil(screen_width / font_width)
	for ii in letters_x_quantity:
		x_positions.append(font_width * ii)
		
	#CALCULATE X(COLUMN) FONT POSITION
	var font_height = 0
	for ii in posibles_chars:
		if matrix_font.get_char_size(ord(str(ii)))[1] > font_height:
			font_height = matrix_font.get_char_size(ord(str(ii)))[1]
	var screen_heigth = get_viewport().size.y
	var letters_y_quantity = ceil(screen_heigth / font_height)
	for ii in letters_y_quantity:
		y_positions.append(font_height * ii)


func create_columns():
	pass

func _physics_process(_delta):
	if time_for_columns > 0:
		time_for_columns -= 1
	else:
		var new_matrix_column = matrix_column.instance()
		new_matrix_column.init(y_positions, x_positions[position_index])
		$MatrixContainer.add_child(new_matrix_column)
		
		position_index = randi()%x_positions.size()
		
		time_for_columns = TIME_IN_SEC * FRAME_PER_SECOND
	
