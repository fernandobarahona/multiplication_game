tool
extends Node2D

export var arrow_line_texture : Texture setget set_arrow_line_texture
export var arrow_pointer_texture : Texture setget set_arrow_pointer_texture
export var number_of_items := 1 setget set_number_of_items
export var selected_item_position := 0 setget	set_selected_item_position

var _arrow_line_heigth := 0
var _arrow_pointer_heigth := 0
var _arrow_line_width := 0
var _arrow_pointer_width := 0

func _ready():
	_get_arrow_line_dimentions()
	_get_arrow_pointer_dimentions()
	_set_arrow_pointer_offset()
	print('ready')
	pass
	#printt(arrow_line_texture, arrow_pointer_texture, number_of_items, selected_item_position)

func set_number_of_items(number) -> void:
	if number < 0:
		number_of_items = 0
	else:
		number_of_items = number
	if Engine.editor_hint:
		_set_arrow_pointer_x_offset()
	
func set_selected_item_position(position) -> void:
	if position >= 1 and position <= number_of_items:
		selected_item_position = position
	#if Engine.editor_hint:
	_set_arrow_pointer_x_offset()

func set_arrow_line_texture(line_texture) -> void:
	print('setter')
	arrow_line_texture = line_texture
	get_node('%Line').texture = arrow_line_texture
	if Engine.editor_hint:
		_get_arrow_line_dimentions()
	
func _get_arrow_line_dimentions() -> void:
	_arrow_line_heigth = get_node('%Line').texture.get_height() if get_node('%Line').texture else 0
	_arrow_line_width = get_node('%Line').texture.get_width() if get_node('%Line').texture else 0
	_set_arrow_pointer_offset()

func set_arrow_pointer_texture(pointer) -> void:
	arrow_pointer_texture = pointer
	get_node('%Pointer').texture = arrow_pointer_texture
	if Engine.editor_hint:
		_get_arrow_pointer_dimentions()

func _get_arrow_pointer_dimentions() -> void:
	_arrow_pointer_heigth = get_node('%Pointer').texture.get_height() if get_node("%Pointer").texture else 0
	_arrow_pointer_width = get_node('%Pointer').texture.get_width() if get_node("%Pointer").texture else 0
	_set_arrow_pointer_offset()

func _set_arrow_pointer_offset() -> void:
	_set_arrow_pointer_x_offset()
	_set_arrow_pointer_y_offset()

func _set_arrow_pointer_y_offset() -> void:
	get_node('%Pointer').offset.y = int(-(_arrow_line_heigth /2 + _arrow_pointer_heigth / 2)) if arrow_line_texture else 0

func _set_arrow_pointer_x_offset() -> void:
	if arrow_line_texture:
		if selected_item_position != number_of_items:
			get_node('%Pointer').offset.x = int(-(_arrow_line_width / 2 - _arrow_pointer_width / 2) + (((_arrow_line_width - _arrow_pointer_width) / (number_of_items - 1)) * (selected_item_position - 1)))
		else:
			get_node('%Pointer').offset.x = int((_arrow_line_width / 2 - _arrow_pointer_width / 2))
	else:
		get_node("%Pointer").offset.x = 0
