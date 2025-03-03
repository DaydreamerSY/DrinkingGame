class_name DefaultSetup

func init():
	var width: int
	var height: int
	
	print(OS.get_name())

	if OS.get_name() == "Windows":
		width = 540
		height = 960
		DisplayServer.window_set_position(DisplayServer.window_get_position() + Vector2i(100, 100))
	elif OS.get_name() == "macOS":
		width = 1080
		height = 1920
	else:
		width = 1080 # Default width for other OS
		height = 1920 # Default height for other OS
		

	DisplayServer.window_set_size(Vector2(width, height))
	print(DisplayServer.window_get_size())
	Global.SCREEN_SIZE_DEVICE = DisplayServer.window_get_size()
