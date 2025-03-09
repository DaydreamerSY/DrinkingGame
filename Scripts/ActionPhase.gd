extends Node2D

@onready var center_screen = $Gameplay/CenterScreenPoint
@onready var poup_continue = $UI/PopupContinue

@onready var card_scene = preload("res://Scenes/Card.tscn")

var max_card_at_once = 5


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	if Global.CONFIG_GAME[Util.CONFIG_GAME_PARAMS.SESSION_CONTENTS].size() > 0:
		_init_board(Global.CONFIG_GAME[Util.CONFIG_GAME_PARAMS.SESSION_CONTENTS])
		poup_continue.visible = true
	else:
		_init_board(Global.CONFIG_GAME[Util.CONFIG_GAME_PARAMS.ALL_CONTENTS])
	
	pass # Replace with function body.


func _init_board(contents: Array):
	for c in contents:
		var _card = card_scene.instantiate()
		#_card.position = center_screen.position
		center_screen.add_child(_card)
		_card.scale = Vector2(0.8, 0.8)
		_card.update_content(c)
		
	pass
