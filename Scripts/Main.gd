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
		
	Global.CONFIG_GAME[Util.CONFIG_GAME_PARAMS.ALL_CONTENTS] = data["contents"]
	
	print(Global.CONFIG_GAME[Util.CONFIG_GAME_PARAMS.ALL_CONTENTS])
	pass # Replace with function body.
