extends MarginContainer

var root

var menu = preload("res://scenes/Menu.tscn")
var juego = preload("res://scenes/Juego.tscn")
var menuInstance
var juegoInstance


func _ready():
	root = get_tree().get_root()
	menuInstance = menu.instance()
	add_child(menuInstance)
	menuInstance.connect("startGameSignal",self,"startGame")

func startGame():
	juegoInstance = juego.instance()
	add_child(juegoInstance)
	menuInstance.call_deferred('free')
	
