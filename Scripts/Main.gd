extends Node2D

@onready var popup_option = $UI/PopupOption

# Called when the node enters the scene tree for the first time.
func _ready():
	# init resolution for mac and window
	var default_setup = DefaultSetup.new()
	default_setup.init()
	
	var data = SaveLoader.load_game(Global.SAVE_FILE_PATH)
	if data == null:
		data = SaveLoader.load_game(Global.SAVE_FILE_PATH_DEFAULT)
		SaveLoader.save_game(Global.SAVE_FILE_PATH, data)
		
	Global.CARD_CONTENT = data
	
	print(Global.CARD_CONTENT)
	pass # Replace with function body.


func _on_play_pressed():
	print("BtnPlay pressed")
	pass # Replace with function body.


func _on_option_pressed():
	print("BtnOption pressed")
	popup_option.visible = !popup_option.visible
	pass # Replace with function body.
