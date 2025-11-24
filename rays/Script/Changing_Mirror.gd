extends StaticBody2D

@onready var mirror: AnimatedSprite2D = $Mirror
@onready var activate_radius: Area2D = $Activate_Radius

var directions = ["first mirror", "second mirror", "third mirror", "fourth mirror"]
var current_index = 0

var testdDirection =[Vector2(32,0),Vector2(32,32),Vector2(0,32),Vector2(0,0)]
var directionCounter = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_process_input(false)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_activate_radius_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		set_process_input(true)

func _on_activate_radius_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		set_process_input(false)

func _input(event) -> void:
	if not is_processing_input():
		return
	
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			current_index = (current_index + 1) % directions.size()
			var node = get_node("Speil_Hitbox")
			node.position = testdDirection[directionCounter]
			directionCounter += 1
			if directionCounter == 4:
				directionCounter = 0 
				
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			current_index = (current_index - 1) %  directions.size()
	mirror.play(directions[current_index])
