extends VBoxContainer

onready var pregunta = get_node("Contenedor Pregunta/Pregunta")
onready var arregloBotonesDeOpciones = [
	get_node("Opciones/Division horizontal/Division Vertical 1/op1"),
	get_node("Opciones/Division horizontal/Division Vertical 1/op2"),
	get_node("Opciones/Division horizontal/Division Vertical 2/op3"),
	get_node("Opciones/Division horizontal/Division Vertical 2/op4"),
]

func _ready():
	nuevaPregunta()



func nuevaPregunta():
	randomize()
	var num1 = randi()%11
	var num2 = randi()%11
	var opcionCorrecta = randi()%4
	var opciones = []
	pregunta.text = "Cuanto es "+str(num1)+" X "+str(num2)
