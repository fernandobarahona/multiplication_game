extends Control

var _matrix_column = preload("matrix_bk__column.tscn")
var _matrix_font = preload("res://scenes_and_scripts/background__matrix/matrix_bk__fading_char.tres")

var posibles_chars:Array = ["0", "1"] 

var _font_chars_max_width := 0
var _font_char_horizontal_separation := 8
var _font_chars_max_heigth := 0

var _columns_positions := []
var _rows_positions := []

var _columns := []
var _columns_not_in_screen := []

var rng = RandomNumberGenerator.new()

func _ready():
	_calculate_font_chars_max_size()
	_calculate_font_positions()
	_create_every_column_and_positionate_it()
	_columns_to_scene_with_random_time()

func _calculate_font_chars_max_size() -> void:
	for ii in posibles_chars.size():
		if _matrix_font.get_char_size(ord(posibles_chars[ii]))[0] > _font_chars_max_width:
			_font_chars_max_width = _matrix_font.get_char_size(ord(posibles_chars[ii]))[0]
		if _matrix_font.get_char_size(ord(posibles_chars[ii]))[1] > _font_chars_max_heigth:
			_font_chars_max_heigth = _matrix_font.get_char_size(ord(str(ii)))[1]
	_font_chars_max_width = _font_chars_max_width + _font_char_horizontal_separation
#Calculates the POSITIONS OF THE CHARS based on FONT WIDTH and SCREEN WIDTH
func _calculate_font_positions() -> void:
	#CALCULATE COLUMN (CHAR_Xs) POSITION
	var screen_width = get_node('.').rect_size.x #get_viewport().size.x
	var columns_quantity = ceil(screen_width / _font_chars_max_width)
	for ii in columns_quantity:
		_columns_positions.append(_font_chars_max_width * ii)
	#CALCULATE ROW (CHAR_Ys) FONT POSITION
	var screen_heigth = get_node('.').rect_size.y #get_viewport().size.y
	var rows_quantity = ceil(screen_heigth / _font_chars_max_heigth)
	for ii in rows_quantity:
		_rows_positions.append(_font_chars_max_heigth * ii)

func _create_every_column_and_positionate_it() -> void:
	for x_position in _columns_positions:
		var new_matrix_column = _matrix_column.instance()
		new_matrix_column.init(_rows_positions, x_position, _font_chars_max_width, _matrix_font, posibles_chars, $TimeBetweenColumnsTimer)
		_columns_not_in_screen.append(new_matrix_column)
		_columns.append(new_matrix_column)

func _columns_to_scene_with_random_time() -> void:
	var _err = $TimeBetweenColumnsTimer.connect("timeout",self,"_put_column_to_scene_tree")

func _put_column_to_scene_tree() -> void:
	if _columns_not_in_screen.size() > 0:
		var column_to_add_to_screen_index = rng.randi_range(0, _columns_not_in_screen.size() - 1)
		var column_to_add_to_screen = _columns_not_in_screen[column_to_add_to_screen_index]
		$MatrixContainer.add_child(column_to_add_to_screen)

		_columns_not_in_screen.remove(column_to_add_to_screen_index)

func tilt_chars_to_char(character_to_tilt_to:String) -> void:
	for column in _columns:
		column._tilt_chars_to_char(character_to_tilt_to)
