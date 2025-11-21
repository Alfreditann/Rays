extends RigidBody2D

var can_push_left = false
var can_push_right = false

func _integrate_forces(state) -> void:
	var vel = state.linear_velocity
	
	#Allow push from sides
	if can_push_left or can_push_right:
		vel.y = 0
	else:
		vel = Vector2.ZERO
	
	state.linear_velocity = vel
	
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_left_detector_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		can_push_left = true
		print("Treff")
func _on_left_detector_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		can_push_left = false
		print("Treff")
func _on_right_detector_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		can_push_right = true
		print("treff")
	
func _on_right_detector_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		can_push_right = false
		print("Treff")
