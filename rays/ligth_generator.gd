extends StaticBody2D
@onready  var ray := $RayCast2D
var beam_enabled :=false
var max_distance := 500
var ray_scene = preload("res://ligth_ray.tscn")
var ray_instance: Node2D = null

func _ready() -> void:
	ray.enabled = false


func _process(delta: float) -> void:

	# Spawn ray when pressing the action
	if Input.is_action_just_pressed("ui_accept") and ray_instance == null:
		ray_instance = ray_scene.instantiate()
		ray_instance.global_position = global_position
		get_tree().current_scene.add_child(ray_instance)

	# Remove it if already spawned and the key is pressed again
	elif Input.is_action_just_pressed("ui_accept") and ray_instance != null:
		ray_instance.queue_free()
		ray_instance = null
