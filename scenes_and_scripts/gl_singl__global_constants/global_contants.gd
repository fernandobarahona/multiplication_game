extends Node2D

var arregloDeRespuestas:Array = crearTodasLasRespuestas()

var SCENES_AND_SCRIPTS_PATHS: Dictionary = {
	"scene__main_menu": "res://scenes_and_scripts/menu__main/main_menu.tscn",
	"scene__config_menu":"res://scenes_and_scripts/menu__config/config_menu.tscn",
	"scene__game":"res://scenes_and_scripts/game/game.tscn",
	"scene__login":"res://scenes_and_scripts/login/login.tscn",
	"scene__register": "res://scenes_and_scripts/register/register.tscn",
	"scene__parallax_background": "res://scenes_and_scripts/background__math_parallax/math_parallax_background.tscn",
	"scene__matrix_background": "res://scenes_and_scripts/background__matrix/matrix_background.tscn"
}

func crearTodasLasRespuestas():
	var arregloDeRespuestasInner = []
	for ii in range(11):
		for jj in range(ii, 11):
			if !arregloDeRespuestasInner.has(ii*jj):
				arregloDeRespuestasInner.append(ii*jj)
	return arregloDeRespuestasInner
