extends Node

#@export var http_request
@export var DATA_URL_CONTENT_NORMAL = "https://docs.google.com/spreadsheets/d/1TIEmAhKgK1IX2-0EfAxEZ73ruPjLnO1KOa8HiZ4dJgQ/edit?gid=0#gid=0"

@export var CARD_CONTENT = {}

@export var SAVE_FILE_PATH_DEFAULT = "res://data/default-data.json" # change to file save and config default (save and config is the samee file)
@export var SAVE_FILE_PATH = "user://game-contents.json" # change to file save and config (save and config is the samee file)

@export var SCREEN_SIZE_DEFAULT = Vector2(1080, 1920)
@export var SCREEN_SIZE_DEVICE = Vector2.ZERO
@export var DEBUG_ENABLE: bool

@export var CONFIG_GAME = {
	"Content enabled": []
}
