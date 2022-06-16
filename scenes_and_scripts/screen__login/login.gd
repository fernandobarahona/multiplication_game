extends Control

var _register_scene = load(GlobalConstants.SCENES_AND_SCRIPTS_PATHS["scene__register"])

onready var _http : HTTPRequest = $HTTPRequest
onready var _username : LineEdit = $CenterContainer/UserNameText
onready var _password : LineEdit = $CenterContainer/PasswordText
# onready var _notification : Label = $CenterContainer/VBoxContainer2/MarginContainer/VBoxContainer/NotificationLabel

func _on_LoginButton_pressed() -> void:
	if _username.text.empty() or _password.text.empty():
		#_notification.text = "Please, enter your username and password"
		return
	Firebase.login(_username.text, _password.text,_http)


# warning-ignore:unused_argument
func _on_HTTPRequest_request_completed(_result: int, response_code: int, _headers: PoolStringArray, body: PoolByteArray) -> void:
# warning-ignore:unused_variable
	var response_body := JSON.parse(body.get_string_from_ascii())
	#if response_code != 200:
		#_notification.text = response_body.result.error.message.capitalize()
	#else:
	#	_notification.text = "Sign in sucessful!"


func _on_RegisterButton_pressed():
	AnimatedSceneManager.change_scene_with_animation(_register_scene)
