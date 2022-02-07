extends Node2D

onready var arregloDeRespuestas = crearTodasLasRespuestas()

func _ready():
    pass

func crearTodasLasRespuestas():
    var arregloDeRespuestasInner = []
    for ii in range(11):
        for jj in range(ii, 11):
            if !arregloDeRespuestasInner.has(ii*jj):
                arregloDeRespuestasInner.append(ii*jj)
    return arregloDeRespuestasInner