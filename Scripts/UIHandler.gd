extends CanvasLayer

@onready var popup_option = $PopupOption
@onready var scene_changer = $SceneChanger


func _on_btn_play_pressed() -> void:
	print("BtnPlay pressed")
	scene_changer.change_to(Util.SCENE.ACTIONPHASE)
	pass # Replace with function body.


func _on_btn_option_pressed() -> void:
	print("BtnOption pressed")
	popup_option.visible = !popup_option.visible
	pass # Replace with function body.


func _on_btn_back_pressed() -> void:
	print("BtnBack pressed")
	scene_changer.change_to(Util.SCENE.MAINMENU)
	pass # Replace with function body.
