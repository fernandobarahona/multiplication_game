extends Control

onready var _question = $ExternalVBoxContainer/QuestionContainer/Question
onready var _question_timer = $ExternalVBoxContainer/HUDContainer/QuestionTimer
onready var _question_generator = $QuestionGenerator

onready var option_btn_array = [
	get_node("%Option1"),
	get_node("%Option2"),
	get_node("%Option3"),
	get_node("%Option4")
]

var tries = 0
var correct_tries = 0
var correct_porcentage = 0

var correct_option_value


func _ready():
	var _err = _question_timer.connect("time_out", self, "evaluate_and_reset", [null])
	new_question()
	for option_btn in option_btn_array:
		option_btn.connect("answer_selected", self, "evaluate_and_reset")

func evaluate_and_reset(press_btn_value):

	var is_correct = true if (press_btn_value == correct_option_value) else false

	Signals.emit_signal("last_tries", is_correct)
		
	new_question()
	_question_timer.restart_timer()

func new_question():
	var new_question_info = _question_generator.create_question()
	var questionNum1 = new_question_info[0]
	var questionNum2 = new_question_info[1]
	correct_option_value = new_question_info[2]
	
	var options = _question_generator.create_options(correct_option_value)

	for ii in options.size():
		option_btn_array[ii].set_new_question(options[ii])
	
	_question.text = str(questionNum1)+"X "+str(questionNum2)
