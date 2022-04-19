extends MarginContainer

onready var _question = $ExternalVBoxContainer/QuestionContainer/Question
onready var _score_bar = $ExternalVBoxContainer/HUDContainer/ScoreBar
onready var _score_bar_text = $ExternalVBoxContainer/HUDContainer/Container/ScoreBarText
onready var _audio_effects_player = $ExternalVBoxContainer/GameSoundEffects
onready var _audio_fx__correct = preload("res://scenes_and_scripts/screen__practice_game/soundEffects/correct.mp3")
onready var _audio_fx__wrong = preload("res://scenes_and_scripts/screen__practice_game/soundEffects/error.mp3")

onready var option_btn_array = [
	$ExternalVBoxContainer/Options/HBox/VBox1/op1,
	$ExternalVBoxContainer/Options/HBox/VBox1/op2,
	$ExternalVBoxContainer/Options/HBox/VBox2/op3,
	$ExternalVBoxContainer/Options/HBox/VBox2/op4
]

var tries = 0
var correct_tries = 0
var correct_porcentage = 0

var correct_value

var answers_array = GlobalConstants.create_posible_answers()

func _ready():
	new_question()
	for option_btn in option_btn_array:
		option_btn.connect("answer_selected", self, "evaluarYReiniciar")

func evaluarYReiniciar(press_btn_value):
	var is_correct
	if press_btn_value == correct_value:
		is_correct = true
	else:
		is_correct = false
	new_question()
	if is_correct == true:
		_audio_effects_player.stream = _audio_fx__correct
		
		_audio_effects_player.play()
		correct_tries = correct_tries + 1
	else:
		_audio_effects_player.stream = _audio_fx__wrong
		_audio_effects_player.play()
	tries = tries + 1
	correct_porcentage = float(correct_tries) / float(tries) * 100
	_score_bar.value = correct_porcentage 
	_score_bar_text.text = str(correct_tries) + " / " + str(tries)

func new_question():
	randomize()
	var questionNum1 = randi()%11
	var questionNum2 = randi()%11
	var opcionCorrecta = randi()%4
	var opciones = [0,0,0,0]
	opciones[opcionCorrecta] = questionNum1 * questionNum2
	for ii in 4:
		if ii != opcionCorrecta:
			var nuevaOpcion = randi()%answers_array.size()
			while opciones.has(nuevaOpcion):
				nuevaOpcion = randi()%answers_array.size()
			opciones[ii] = answers_array[nuevaOpcion]
	for ii in 4:
		option_btn_array[ii].set_new_question(opciones[ii])
	correct_value = questionNum1 * questionNum2
	_question.text = "Cuanto es \n"+str(questionNum1)+"X "+str(questionNum2)
