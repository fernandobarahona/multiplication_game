extends Node

signal BackgroundChanged

var MATRIX_BACKGROUND = ["Matrix", GlobalConstants.SCENES_AND_SCRIPTS_PATHS["scene__matrix_background"]]
var PARALLAX_BACKGROUND = ["Parallax", GlobalConstants.SCENES_AND_SCRIPTS_PATHS["scene__parallax_background"]]
var FOGGY_BACKGROUND = ["Foggy", GlobalConstants.SCENES_AND_SCRIPTS_PATHS["scene__foggy_mountain"]]
var POSIBLE_BACKGROUNDS = [
	MATRIX_BACKGROUND, 
	PARALLAX_BACKGROUND,
	FOGGY_BACKGROUND
	]

onready var _user_config_file = File.new()
onready var _user_config_file_path = "user://config.save"

onready var selected_background = _read_selected_background_from_file() setget selected_background_set

func selected_background_set(new_value):
	_write_selected_background_to_file(new_value)
	emit_signal("BackgroundChanged",new_value[1])
	selected_background = new_value
	
func _write_selected_background_to_file(selected_background_to_write):
	_user_config_file.open(_user_config_file_path, File.WRITE)
	_user_config_file.store_var(selected_background_to_write)
	_user_config_file.close()

func _read_selected_background_from_file():
	var return_value
	if  _user_config_file.file_exists(_user_config_file_path):
		_user_config_file.open(_user_config_file_path, File.READ)
		return_value = _user_config_file.get_var()
		_user_config_file.close()
	else:
		return_value = PARALLAX_BACKGROUND
	return return_value
