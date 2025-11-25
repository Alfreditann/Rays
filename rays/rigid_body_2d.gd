extends RigidBody2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	print(get_speil)
	if Input.is_action_pressed("move_rigth") or Input.is_action_just_pressed("ui_right"):
		print(get_speil)
		self.position =Vector2(0,1)


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "$Hurtbox":
		area.get_parent().queue_free()
		
