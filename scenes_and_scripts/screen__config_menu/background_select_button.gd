extends OptionButton

func _ready():
	
	#create items based on posible backgrounds declared in Global Values
	for ii in UserConfig.POSIBLE_BACKGROUNDS.size():
		self.add_item(UserConfig.POSIBLE_BACKGROUNDS[ii][0] + " Background",ii)
	
	#Select the current selected backgraound on the button 
	self.select(UserConfig.POSIBLE_BACKGROUNDS.find(UserConfig.selected_background))
	
func _on_BakcgroundSelectButton_item_selected(index):
	UserConfig.selected_background = UserConfig.POSIBLE_BACKGROUNDS[index]
