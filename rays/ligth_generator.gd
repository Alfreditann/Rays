extends StaticBody2D

var ray = preload("res://ligth_ray.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		var instance = ray.instantiate()
		instance.global_position = Vector2(global_position)
		get_tree().current_scene.add_child(instance)
	
