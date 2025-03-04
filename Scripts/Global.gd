extends Node

@export var DATA_URL_CONTENT_NORMAL = "https://docs.google.com/spreadsheets/d/1TIEmAhKgK1IX2-0EfAxEZ73ruPjLnO1KOa8HiZ4dJgQ/edit?gid=0#gid=0"

## Save and Load file
@export var SAVE_FILE_PATH_DEFAULT = "res://data/default-data.json" # change to file save and config default (save and config is the samee file)
@export var SAVE_FILE_PATH = "user://game-contents.json" # change to file save and config (save and config is the samee file)

## Setup screen size
@export var SCREEN_SIZE_DEFAULT = Vector2(1080, 1920)
@export var SCREEN_SIZE_DEVICE = Vector2.ZERO

## Enable Debug
@export var DEBUG_ENABLE: bool

## Config, save when exit or update content's data and settings
@export var CONFIG_GAME = {
	"card content": [],
	"content enabled": []
}

## Session data, use for resume, contine game, vfx based on played time,...
@export var SESSION_DATA = {
	"contents": [],
	"isResume": false,
	"resumeContent": [],
}
