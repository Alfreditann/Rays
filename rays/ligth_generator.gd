extends StaticBody2D

@onready var ray: RayCast2D = $RayCast2D
@onready var line: Line2D = $Line2D


var active: bool = false
var max_distance: float = 50000.0  # effectively “infinite”

func _ready() -> void:
	ray.enabled = false
	line.visible = false
	line.points = [Vector2.ZERO, Vector2.ZERO]

func _process(delta: float) -> void:
	# Toggle the beam with a key
	if ray.is_colliding():
		var cp = ray.get_collision_point()
		var local_cp = to_local(cp)
		line.points[1]
	if Input.is_action_just_pressed("ui_accept"):
		active = !active
		ray.enabled = active
		line.visible = active

	if active:
		# Update ray target
		ray.target_position = Vector2(max_distance, 0).rotated(rotation)
		ray.force_raycast_update()

		# Determine where the line should end
		var end_point: Vector2
		if ray.is_colliding():
			# If it hits something, use collision point
			end_point = to_local(ray.get_collision_point())
		else:
			# Otherwise, go “infinite” (really just max_distance)
			end_point = Vector2(max_distance, 0).rotated(rotation)

		# Update Line2D
		line.points = [Vector2.ZERO, end_point]
		
