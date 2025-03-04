extends Node


enum SCENE {MAINMENU, ACTIONPHASE}
@export var SCENE_PATH : Dictionary = {
	SCENE.MAINMENU: "res://Scenes/MainMenu.tscn",
	SCENE.ACTIONPHASE: "res://Scenes/ActionPhase.tscn",
}
