extends RigidBody2D

var speed := 300
var last_hit_time := 0.0
var hit_delay := 0.2 # prevents multiple triggers per frame

func _ready():
	linear_velocity = Vector2.RIGHT.rotated(rotation) * speed
	$Area2D.area_entered.connect(_on_area_entered)


func _on_area_entered(area):
	# Prevent duplicate trigger if still colliding
	if Time.get_ticks_msec() - last_hit_time < hit_delay * 1000:
		return

	last_hit_time = Time.get_ticks_msec()

	if area.name == "Speil_Hitbox":
		print("Hit Speil_Hitbox!")
		_Hit(90)

	elif area.name == "Speil_Hitbox2":
		print("Hit Speil_Hitbox2!")
		_Hit(180)
	$Timer.start() # restart lifetime timer


func _Hit(angle_change):
	var rect = RectangleShape2D.new()

	# Rotate physics direction
	rotation += deg_to_rad(angle_change)
	linear_velocity = Vector2.RIGHT.rotated(rotation) * speed

	# Rotate sprite
	$Sprite2D.rotation = rotation

	# Update shape 
	rect.extents = Vector2(4,16)
	$Area2D/CollisionShape2D.shape = rect


func _on_timer_timeout():
	queue_free()
