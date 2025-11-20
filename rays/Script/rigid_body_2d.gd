extends RigidBody2D

var speed := 300
var has_hit := false

func _ready():
	linear_velocity = Vector2.RIGHT.rotated(rotation) * speed

	# Connect Area2D collision
	$Area2D.area_entered.connect(_on_area_entered)

func _on_area_entered(area):
	$Timer.wait_time = 3
	$Timer.start()
	print("Hit detected!") # Debug
	_Hit()


func _Hit():
	if has_hit:
		return

	has_hit = true

	# Change trajectory once
	rotation += deg_to_rad(90)
	linear_velocity = Vector2.RIGHT.rotated(rotation) * speed

	# Rotate sprite to match new direction
	$Sprite2D.rotation = rotation

	# Disable further collisions
	$Area2D.monitoring = false
	$Area2D.monitorable = false
	$Area2D/CollisionShape2D.set_disabled(true)
	


func _on_timer_timeout() -> void:
	queue_free()
