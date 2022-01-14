extends CenterContainer

signal startGameSignal

func _ready():
	var err = get_node("Boton Menu").connect("pressed",self,"emitStartGameSignal")
	if err != OK:
		print("Failure!")

func emitStartGameSignal():
	emit_signal("startGameSignal")

