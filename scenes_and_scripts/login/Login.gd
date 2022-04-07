extends CanvasLayer

var registerScene = load(GlobalValues.SCENES_AND_SCRIPTS_PATHS["scene__register"])

onready var http : HTTPRequest = $HTTPRequest
onready var username : LineEdit = $VBoxContainer/UserNameHContainer/UserNameText
onready var password : LineEdit = $VBoxContainer/PasswordHContainer/PasswordText
onready var notification : Label = $VBoxContainer/NotificationLabel

func _on_LoginButton_pressed() -> void:
	if username.text.empty() or password.text.empty():
		notification.text = "Please, enter your username and password"
		return
	Firebase.login(username.text, password.text, http)


func _on_HTTPRequest_request_completed(_result: int, response_code: int, _headers: PoolStringArray, body: PoolByteArray) -> void:
	var response_body := JSON.parse(body.get_string_from_ascii())
	if response_code != 200:
		notification.text = response_body.result.error.message.capitalize()
	else:
		notification.text = "Sign in sucessful!"


func _on_GoToRegisterButton_pressed():
	SceneManager.gotoScene(registerScene)
