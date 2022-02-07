extends Button

signal respuestaSeleccionada(valor)

var miValor:int

func _ready():
	var err = self.connect("pressed", self, "enviarMiValor")
	if err != 0:
		print('error found')

func enviarMiValor():
	emit_signal("respuestaSeleccionada", miValor)


func iniciarEnNuevaPregunta(miValorIn: int):
	miValor = miValorIn

	self.set_size(Vector2(49, 57))
	self.text = str(miValor)
