extends RigidBody2D

var can_push_up = false
var can_push_down = false

func _integrate_forces(state) -> void:
	var v = state.linear_velocity
	
	#Allow push from sides
	if can_push_up or can_push_down:
		v.x = 0
	else:
		v = Vector2.ZERO
	
	state.linear_velocity = v

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_up_detector_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		can_push_up = true


func _on_up_detector_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		can_push_up = true


func _on_down_detector_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		can_push_down = true


func _on_down_detector_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		can_push_down = true
