extends Sprite2D

var fireball = preload("res://rigid_body_2d.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(get_global_mouse_position())
	rotation -= deg_to_rad(90)
	if Input.is_action_just_pressed("ui_accept"):
		var instance = fireball.instantiate()
		instance.global_position = Vector2(global_position)
		get_tree().current_scene.add_child(instance)
	
	
