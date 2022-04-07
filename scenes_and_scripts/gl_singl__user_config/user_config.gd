extends Node

signal BackgroundChanged

var MATRIX_BACKGROUND = ["Matrix", GlobalValues.SCENES_AND_SCRIPTS_PATHS["scene__matrix_background"]]
var PARALLAX_BACKGROUND = ["Parallax", GlobalValues.SCENES_AND_SCRIPTS_PATHS["scene__parallax_background"]]
var POSIBLE_BACKGROUNDS = [
	MATRIX_BACKGROUND, 
	PARALLAX_BACKGROUND
	]

onready var user_config_file = File.new()
onready var user_config_file_path = "user://config.save"

onready var selected_background = read_selected_background_from_file() setget selected_background_set

func selected_background_set(new_value):
	write_selected_background_to_file(new_value)
	emit_signal("BackgroundChanged",new_value[1])
	selected_background = new_value
	
func write_selected_background_to_file(selected_background_to_write):
	user_config_file.open(user_config_file_path, File.WRITE)
	user_config_file.store_var(selected_background_to_write)
	user_config_file.close()

func read_selected_background_from_file():
	var return_value
	if  user_config_file.file_exists(user_config_file_path):
		user_config_file.open(user_config_file_path, File.READ)
		return_value = user_config_file.get_var()
		user_config_file.close()
	else:
		return_value = PARALLAX_BACKGROUND
	return return_value
