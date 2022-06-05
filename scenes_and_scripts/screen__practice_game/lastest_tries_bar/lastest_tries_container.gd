extends MarginContainer

export var size:int

var try_texture = preload("res://scenes_and_scripts/screen__practice_game/lastest_tries_bar/try_texture.tscn")
onready var new_try_texture 

onready var _last_tries_array := [] 
onready var _last_tries_nodes_array :=[]

# warning-ignore:return_value_discarded
func _ready(): 
	Signals.connect("last_tries", self, "last_tries_calc")
	for ii in size:
		new_try_texture = try_texture.instance()
		new_try_texture.texture = new_try_texture.new_try
		new_try_texture.rect_min_size = Vector2(70,70)
		_last_tries_nodes_array.push_front(new_try_texture)
		$HBoxContainer.add_child(new_try_texture)



func last_tries_calc(last_try) -> void:

	_last_tries_array.push_front(int(last_try))
	
	if _last_tries_array.size() > size:
		_last_tries_array.pop_back()

	for ii in _last_tries_array.size():
		if _last_tries_array[ii] == 1:
			_last_tries_nodes_array[ii].texture = new_try_texture.correct_try
		elif _last_tries_array[ii] == 0:
			_last_tries_nodes_array[ii].texture = new_try_texture.wrong_try
		
	var _correct_tries = float(_last_tries_array.count(1))
	$Last20TtriesBar.value = _correct_tries / float(_last_tries_array.size()) * 100

