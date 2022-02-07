extends VBoxContainer

onready var pregunta = get_node("Contenedor Pregunta/Pregunta")
onready var arregloBotonesDeOpciones = [
	get_node("Opciones/Division horizontal/Division Vertical 1/op1"),
	get_node("Opciones/Division horizontal/Division Vertical 1/op2"),	
	get_node("Opciones/Division horizontal/Division Vertical 2/op3"),
	get_node("Opciones/Division horizontal/Division Vertical 2/op4"),
]
onready var barraAciertos = get_node("barraAciertosContenedor/barraAciertos")
onready var barraAciertosTexto = get_node("barraAciertosContenedor/textoBarraAciertos")
onready var audioEffectsPlayer = get_node("AudioStreamPlayer2D")
onready var effectoAcierto = preload("res://assets/soundEffects/correct.mp3")
onready var effectoError = preload("res://assets/soundEffects/error.mp3")

var intentos = 0
var aciertos = 0
var porcentaje = 0

var valorCorrecto

var arregloDeRespuestas = GlobalValues.crearTodasLasRespuestas()

func _ready():
	nuevaPregunta()
	for botonDeOpcion in arregloBotonesDeOpciones:
		botonDeOpcion.connect("respuestaSeleccionada", self, "evaluarYReiniciar")

func evaluarYReiniciar(valorRecibidoDeOpcionPresionada):
	var acierto
	if valorRecibidoDeOpcionPresionada == valorCorrecto:
		acierto = true
	else:
		acierto = false
	nuevaPregunta()
	if acierto == true:
		audioEffectsPlayer.stream = effectoAcierto
		
		audioEffectsPlayer.play()
		aciertos = aciertos + 1
	else:
		audioEffectsPlayer.stream = effectoError
		audioEffectsPlayer.play()
	intentos = intentos + 1
	porcentaje = float(aciertos) / float(intentos) * 100
	barraAciertos.value = porcentaje 
	barraAciertosTexto.text = str(aciertos) + " / " + str(intentos)

func nuevaPregunta():
	randomize()
	var preguntaNum1 = randi()%11
	var preguntaNum2 = randi()%11
	var opcionCorrecta = randi()%4
	var opciones = [0,0,0,0]
	opciones[opcionCorrecta] = preguntaNum1 * preguntaNum2
	for ii in 4:
		if ii != opcionCorrecta:
			var nuevaOpcion = randi()%arregloDeRespuestas.size()
			while opciones.has(nuevaOpcion):
				nuevaOpcion = randi()%arregloDeRespuestas.size()
			opciones[ii] = arregloDeRespuestas[nuevaOpcion]
	for ii in 4:
		arregloBotonesDeOpciones[ii].iniciarEnNuevaPregunta(opciones[ii])
	valorCorrecto = preguntaNum1 * preguntaNum2
	pregunta.text = "Cuanto es "+str(preguntaNum1)+" X "+str(preguntaNum2)
