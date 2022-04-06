extends CanvasLayer

var logInScene = load("res://scenes_and_scripts/login/Login.tscn")

onready var http : HTTPRequest = $HTTPRequest
onready var username : LineEdit = $VBoxContainer/UserNameHContainer/UserNameText
onready var password : LineEdit = $VBoxContainer/PasswordHContainer/PasswordText
onready var confirm : LineEdit = $VBoxContainer/ConfirmPasswordHContainer/ConfirmPasswordText
onready var notification : Label = $VBoxContainer/NotificationLabel

func _on_RegisterButton_pressed():
	if password.text != confirm.text or username.text.empty() or password.text.empty():
		notification.text = "Invalid password or username"
		return
	Firebase.register(username.text, password.text, http)

func _on_HTTPRequest_request_completed(_result: int, response_code: int, _headers: PoolStringArray, body: PoolByteArray) -> void:
	var response_body := JSON.parse(body.get_string_from_ascii())
	if response_code != 200:
		notification.text = response_body.result.error.message.capitalize()
	else:
		notification.text = "Registration sucessful!"
		yield(get_tree().create_timer(2.0), "timeout")
		#get_tree().change_scene("res://interface/login/Login.tscn")


func _on_GoToLoginButton_pressed():
	SceneManager.gotoScene(logInScene)
