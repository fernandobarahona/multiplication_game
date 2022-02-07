extends Button

signal respuestaSeleccionada(acierto)

var miValor
var valorCorrecto

func _ready():
	var err = self.connect("pressed", self, "evaluarYReiniciar")
	if err != 0:
		print('error found')

func evaluarYReiniciar():
	var acierto
	if miValor == valorCorrecto:
		acierto = true
	else:
		acierto = false
	emit_signal("respuestaSeleccionada", acierto)

func iniciarEnNuevaPregunta(miValorIn: int, valorCorrectoIn: int):
	miValor = miValorIn
	valorCorrecto = valorCorrectoIn

	self.set_size(Vector2(49, 57))
	self.text = str(miValor)
