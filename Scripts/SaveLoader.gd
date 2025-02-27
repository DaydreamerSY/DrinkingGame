extends Node

func save_game(path: String, data: Dictionary):
	var save_game = FileAccess.open(path, FileAccess.WRITE)
	var json_string = JSON.stringify(data)

	save_game.store_line(json_string)


func load_game(path: String):
	if not FileAccess.file_exists(path):
		print("can't not find save files")
		return null # Error! We don't have a save to load.


	var save_game = FileAccess.open(path, FileAccess.READ)
	

	var json = JSON.new()
	
	while save_game.get_position() < save_game.get_length():
		var json_string = save_game.get_line()

		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue

		# Get the data from the JSON object
		#Global.card_contents = json.get_data()
		#print(GlobalVariant.card_contents)
	return json.get_data()
