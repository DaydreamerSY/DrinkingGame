extends RigidBody2D

@onready var label_content = $LabelContent
@onready var btn_select = $LabelContent/BtnSelect
@onready var OFFSET = 0.95;

var is_dragging = false
var touch_point : Vector2
var release_point : Vector2
var swipe_length = 10


var available_rect: Rect2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if is_dragging and event is InputEventScreenDrag:
		#var offset = event.position - touch_point
		var offset = event.relative
		#global_position = get_global_mouse_position()
		position += offset


func update_content(new_content):
	label_content.text = new_content
	pass


func _on_btn_select_button_down() -> void:
	print("Card button down")
	is_dragging = true
	touch_point = get_local_mouse_position()
	pass # Replace with function body.


func _on_btn_select_button_up() -> void:
	is_dragging = false
	print("Card button up")
	print(available_rect)
	print("Mouse position | released : ", get_local_mouse_position())
	var mouse_release_point = get_local_mouse_position()
	print(touch_point - mouse_release_point)
	
	if touch_point.distance_to(mouse_release_point) >= swipe_length:
		var flick_velocity = (mouse_release_point - touch_point).normalized() * 3500
		apply_impulse(
			flick_velocity,
			mouse_release_point
		)
	
