extends Node2D

var menu = preload("res://scenes/Menu.tscn")
var menuInstance

func _ready():
	SceneManager.gotoScene(menu)
	
	
