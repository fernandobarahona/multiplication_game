extends MarginContainer

onready var juego = get_node("Contenedor Juego")
onready var menu = get_node("Contenedor Menu")
onready var botonMenu = get_node("Contenedor Menu/Boton Menu")
onready var pregunta = get_node("Contenedor Juego/Contenedor Pregunta/Pregunta");
onready var arregloBotonesDeOpciones = [
	get_node("Contenedor Juego/Opciones/Division horizontal/Division Vertical 1/op1"),
	get_node("Contenedor Juego/Opciones/Division horizontal/Division Vertical 1/op2"),
	get_node("Contenedor Juego/Opciones/Division horizontal/Division Vertical 2/op3"),
	get_node("Contenedor Juego/Opciones/Division horizontal/Division Vertical 2/op4"),
]
var arregloDeRespuestas

func _ready():
	arregloDeRespuestas = crearTodasLasRespuestas()
	juego.hide()
	botonMenu.connect("pressed",self,"jugar")

func jugar():
	nuevaPregunta()
	juego.show()
	menu.hide()
	for ii in arregloBotonesDeOpciones:
		ii.connect("pressed", self, 'calificar')

func nuevaPregunta():
	randomize()
	var num1 = randi()%11
	var num2 = randi()%11
	var opcionCorrecta = randi()%4
	var opciones = []
	for ii in 4:
		var nuevaOpcion = str(arregloDeRespuestas[randi()%11][randi()%11])
		if ii == opcionCorrecta:
			nuevaOpcion = str(num1 * num2)
		else:
			for jj in ii:
				if nuevaOpcion == opciones[jj]:
					nuevaOpcion = str(arregloDeRespuestas[randi()%11][randi()%11])
		opciones.append(nuevaOpcion)
	for ii in 4:
		arregloBotonesDeOpciones[ii].text = str(opciones[ii])
		arregloBotonesDeOpciones[ii].set_size(Vector2(49, 57))
	print(opciones)
	pregunta.text = "Cuanto es "+str(num1)+" X "+str(num2)

func calificar():
	print('calificado')
	

func crearTodasLasRespuestas():
	var arregloDeRespuestas = []
	for ii in range(11):
		arregloDeRespuestas.append([])
		for jj in range(11):
			arregloDeRespuestas[ii].append(ii*jj)
#	print(arregloDeRespuestas)
	return arregloDeRespuestas




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
