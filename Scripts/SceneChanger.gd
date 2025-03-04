extends CanvasLayer

func change_to(new_scene: Util.SCENE):
	print("Change scene: ", Util.SCENE_PATH[new_scene])
	get_tree().call_deferred("change_scene_to_file", Util.SCENE_PATH[new_scene])
	pass
