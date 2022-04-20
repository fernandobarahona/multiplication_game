extends Node2D

var _previous_scene : PackedScene
var _current_scene : PackedScene
var _scene_history : Array

func goto_scene(sceneToGo: PackedScene, mainContainer:Node = get_node("/root/Main/MainContainer")):
	
	
	#save the last current scene to a new previous scene
	if _current_scene:
		_previous_scene = _current_scene
		_scene_history.push_back(_current_scene.get_state().get_node_name(0))
	#Animate the precious_scene_node to fade out. Then erase previous_scene_nodes from tree and memory
	if mainContainer.get_child_count() != 0:
		var previous_scene_node = mainContainer.get_child(0)
		yield(_fade_out(previous_scene_node), "completed")
		previous_scene_node.call_deferred('free')
	#instanciate the new scene and add it to the tree
	var sceneToGoInstance = sceneToGo.instance()
	mainContainer.add_child(sceneToGoInstance)
	#save the current scene 
	_current_scene = sceneToGo
	print(_scene_history)

##	Create the function to go to previous scene
func goto_previousScene():
	pass

func _fade_out(_container : Node):
	
	var transition_rect = ColorRect.new()
	var transition_tween = Tween.new()
	_container.add_child(transition_rect)
	_container.add_child(transition_tween)

	var _fadeIn = transition_tween.interpolate_property(transition_rect, 
										"color", Color("00000000"),
										Color("000000"),0.5)
	var _fadeInStart = transition_tween.start()
	yield(transition_tween, "tween_completed")
