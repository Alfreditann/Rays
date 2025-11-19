extends StaticBody2D

@onready var mirror: AnimatedSprite2D = $Mirror
@onready var activate_radius: Area2D = $Activate_Radius

var directions = ["first mirror", "second mirror", "third mirror", "fourth mirror"]
var current_index = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_activate_radius_body_entered(body: Node2D) -> void:
	if body.name == Player:
		set_process_input(true)
	pass # Replace with function body.


func _on_activate_radius_body_exited(body: Node2D) -> void:
	pass # Replace with function body.

func _input(event) -> void:
	
	if not is_processing_input():
		return
	
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		current_index += 1
	if current_index >= directions.size():
		current_index = 0
	elif event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_RIGHT:
		current_index -= 1
		if current_index >= directions.size():
			current_index = 3
	play(directions[current_index])
