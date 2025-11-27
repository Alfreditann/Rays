extends RigidBody2D

var speed := 600
var last_hit_time := 0.0
var hit_delay := 0.2 # prevents multiple triggers per frame
var rect_shape1 = 0
func _ready():
	linear_velocity = Vector2.RIGHT.rotated(rotation) * speed
	$Area2D.area_entered.connect(_on_area_entered)


func _on_area_entered(area):
	
	# Prevent duplicate trigger if still colliding
	if Time.get_ticks_msec() - last_hit_time < hit_delay * 1000:
		return

	
	print(area.name)
	if area.name == "Speil_Hitbox":
		print("Hit Speil_Hitbox!")
		rect_shape1 = 1
		
		if global.direction == "up":
			_Hit(90)
		last_hit_time = Time.get_ticks_msec()

	elif area.name == "Speil_Hitbox2":
		print("Hit Speil_Hitbox2!")
		rect_shape1 = 2
		if global.direction =="up":
			_Hit(360)
		elif global.direction == "left":
			_Hit(90)
		last_hit_time = Time.get_ticks_msec()
	elif area.name == "Speil_Hitbox3":
		rect_shape1 = 3
		if global.direction == "left":
			_Hit(360)  
		last_hit_time = Time.get_ticks_msec()
	elif area.name == "Speil_Hitbox4":
		rect_shape1 = 4
		if global.direction == "right":
			_Hit(180)  
		last_hit_time = Time.get_ticks_msec()
	elif area.name == "Speil_Hitbox5":
		rect_shape1 = 5
		if global.direction =="up":
			_Hit(360)
		elif global.direction == "left":
			_Hit(90)
		last_hit_time = Time.get_ticks_msec()
	elif area.name == "Speil_Hitbox6":
		rect_shape1 = 6
		if global.direction =="down":
			_Hit(-90)
		last_hit_time = Time.get_ticks_msec()
	elif area.name == "Speil_Hitbox7":
		rect_shape1 = 7
		if global.direction =="right":
			_Hit(90)
		elif global.direction == "up":
			_Hit(180)
		last_hit_time = Time.get_ticks_msec()
	elif area.name == "Speil_Hitbox8":
		rect_shape1 = 8
		if global.direction =="right":
			_Hit(-90)
		elif global.direction == "up":
			_Hit(180)
		last_hit_time = Time.get_ticks_msec()
		
		

	$Timer.start() # restart lifetime timer


func _Hit(angle_change):
	var rect = RectangleShape2D.new()

	# Set rotation DIRECTLY (not adding)
	rotation = deg_to_rad(angle_change)

	# Apply new movement direction
	linear_velocity = Vector2.RIGHT.rotated(rotation) * speed

	# Rotate sprite visually
	$Sprite2D.rotation = rotation
	
	

	# Update hitbox shape
	if rect_shape1 == 1:
		rect.extents = Vector2(4,16)
	elif rect_shape1 == 2:
		rect.extents = Vector2(16,4)
	elif rect_shape1 == 3:
		rect.extents = Vector2(4,16)
	elif rect_shape1 == 4:
		rect.extents = Vector2(16,4)
	elif rect_shape1 == 5:
		rect.extents = Vector2(16,4)

	$Area2D/CollisionShape2D.shape = rect

func _on_timer_timeout():
	queue_free()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "Hurtbox":
		queue_free()
	
