extends Button

var arregloDeRespuestas = crearTodasLasRespuestas()

func _ready():
	print('s')


func crearTodasLasRespuestas():
	var arregloDeRespuestasInner = []
	for ii in range(11):
		arregloDeRespuestasInner.append([])
		for jj in range(11):
			arregloDeRespuestasInner[ii].append(ii*jj)
	return arregloDeRespuestasInner
