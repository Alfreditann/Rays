extends StaticBody2D

signal speilHit

func _ready() -> void:
	print("self")
	if Input.is_action_pressed("move_rigth") or Input.is_action_just_pressed("ui_right"):
		print(self)
		self.position =Vector2(0,1)

func _on_area_2d_area_entered(area: Area2D) -> void:
	emit_signal("speilHit")
	

func _physics_process(delta: float) -> void:
	pass
