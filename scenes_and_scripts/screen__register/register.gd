extends Control

var _logInScene = load(GlobalConstants.SCENES_AND_SCRIPTS_PATHS["scene__login"])

onready var _http : HTTPRequest = $HTTPRequest
onready var _username : LineEdit = $RegisterControl/UserNameText
onready var _password : LineEdit = $RegisterControl/PasswordText
onready var _confirm : LineEdit = $RegisterControl/PasswordConfirmText
#onready var _notification : Label = $CenterContainer/VBoxContainer/CenterContainer/VBoxContainer/NotificationLabel

func _on_RegisterButton_pressed():
	if _password.text != _confirm.text or _username.text.empty() or _password.text.empty():
		#_notification.text = "Invalid password or username"
		return
	Firebase.register(_username.text, _password.text, _http)

#func _on_HTTPRequest_request_completed(_result: int, response_code: int, _headers: PoolStringArray, body: PoolByteArray) -> void:
	#var response_body := JSON.parse(body.get_string_from_ascii())
	#if response_code != 200:
		#_notification.text = response_body.result.error.message.capitalize()
	#else:
	#	_notification.text = "Registration sucessful!"
		#yield(get_tree().create_timer(2.0), "timeout")
		#get_tree().change_scene("res://interface/login/Login.tscn")




func _on_GoToLogin_pressed():
	AnimatedSceneManager.change_scene_with_animation(_logInScene)
