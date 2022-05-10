extends MarginContainer

onready var last_tries_bar = $Last20TtriesBar
onready var last_tries_array = [] 
onready var _last_try = AnswerSignals.connect("last_tries", self, "last_tries_calc")

var faultless_score := 0

func last_tries_calc(last_try) -> void:
	if (last_try == 1):
		faultless_score += 1
	else:
		faultless_score = 0
		
	last_tries_array.push_front(last_try)
	
	if last_tries_array.size() > 20:
		last_tries_array.pop_back()
	
	var _correct_tries = float(last_tries_array.count(1))
	last_tries_bar.value = _correct_tries / float(last_tries_array.size()) * 100
	
	#print(faultless_score)
	#print(last_tries_array)
