extends OptionButton

func _ready():
	
	#create items based on posible backgrounds declared in Global Values
	for ii in GlobalValues.POSIBLE_BACKGROUNDS.size():
		self.add_item(GlobalValues.POSIBLE_BACKGROUNDS[ii][0] + " Background",ii)
	
	#Select the current selected backgraound o the button 
	self.select(GlobalValues.POSIBLE_BACKGROUNDS.find(GlobalValues.selected_background))
	
func _on_BakcgroundSelectButton_item_selected(index):
	GlobalValues.selected_background = GlobalValues.POSIBLE_BACKGROUNDS[index]
