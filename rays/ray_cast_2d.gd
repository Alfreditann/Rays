extends RayCast2D

@onready var ray := $RayCast2D
var light_enabled := false
var max_distance := 500

func _process(delta):
	# Update ray direction/length
	ray.target_position = Vector2(max_distance, 0).rotated(ray.rotation)

	if Input.is_action_just_pressed("toggle_light"):
		light_enabled = !light_enabled
		ray.enabled = light_enabled

	if ray.enabled:
		ray.force_raycast_update()

		if ray.is_colliding():
			print("Hit:", ray.get_collider())
