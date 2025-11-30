extends RigidBody2D



var speed := 340
var last_hit_time := 0.0
var hit_delay := 0.2 # prevents multiple triggers per frame
var rect_shape1 = 0
@onready var anim = $AnimatedSprite2D
func _ready():
	linear_velocity = Vector2.RIGHT.rotated(rotation) * speed
	$Area2D.area_entered.connect(_on_area_entered)
	
	$Timer.wait_time = 1
	$Timer.start()
	# Physics safety
	gravity_scale = 0
	lock_rotation = true   # Godot 4 property; if Godot 3 use 'freeze' or 'can_sleep' settings accordingly
	angular_velocity = 0
	# Make sure the body isn't sleeping when we set velocity
	sleeping = false

func start_motion() -> void:
	# Compute velocity from the current rotation
	linear_velocity = Vector2.RIGHT.rotated(rotation).normalized() * speed
	sleeping = false
	# Debug:

func _on_area_entered(area):
	# Prevent duplicate trigger if still colliding
	if Time.get_ticks_msec() - last_hit_time < hit_delay * 1000:
		return

	print(area.name)

	if area.name == "Speil_Hitbox":
		print("Hit Speil_Hitbox!")
		rect_shape1 = 1
		print(global.direction)
		if global.direction == "up":
			_Hit(-90)
		elif global.direction == "left":
			_Hit(-90)
		elif global.direction == "right":
			_Hit(-90)
		elif global.direction == "down":
			_Hit(-90)
		last_hit_time = Time.get_ticks_msec()
		
	elif area.name == "Speil_Hitbox2":
		print("Hit Speil_Hitbox2!")
		rect_shape1 = 2
		if global.direction == "up":
			_Hit(-90)  # 360 degrees = 0 radians
		elif global.direction == "left":
			_Hit(-90)
		elif global.direction == "right":
			_Hit(-90)
		elif global.direction == "down":
			_Hit(-90)
		last_hit_time = Time.get_ticks_msec()

	elif area.name == "Speil_Hitbox3":
		rect_shape1 = 3
		if global.direction == "left":
			_Hit(180)
		elif global.direction == "right":
			_Hit(180)
		elif global.direction == "up":
			_Hit(180)
		elif global.direction == "down":
			_Hit(180)
		last_hit_time = Time.get_ticks_msec()

	elif area.name == "Speil_Hitbox4":
		rect_shape1 = 4
		if global.direction == "right":
			_Hit(90)
		elif global.direction == "left":
			_Hit(180)
		elif global.direction == "up":
			_Hit(180)
		elif global.direction == "down":
			_Hit(180)
		last_hit_time = Time.get_ticks_msec()

	elif area.name == "Speil_Hitbox5":
		rect_shape1 = 5
		if global.direction == "up":
			_Hit(90)
		elif global.direction == "left":
			_Hit(90)
		elif global.direction == "right":
			_Hit(90)
		elif global.direction == "down":
			_Hit(90)
		last_hit_time = Time.get_ticks_msec()

	elif area.name == "Speil_Hitbox6":
		rect_shape1 = 6
		if global.direction == "down":
			_Hit(180)
		elif global.direction == "right":
			_Hit(180)
		elif global.direction == "up":
			_Hit(180)
		elif global.direction == "left":
			_Hit(180)
		last_hit_time = Time.get_ticks_msec()

	elif area.name == "Speil_Hitbox7":
		rect_shape1 = 7
		if global.direction == "left":
			_Hit(180)
		elif global.direction == "down":
			_Hit(180)
		elif global.direction == "up":
			_Hit(180)
		elif global.direction == "right":
			_Hit(180)
		last_hit_time = Time.get_ticks_msec()

	elif area.name == "Speil_Hitbox8":
		rect_shape1 = 8
		if global.direction == "right":
			_Hit(180)
		elif global.direction == "down":
			_Hit(180)
		elif global.direction == "right":
			_Hit(180)
		elif global.direction == "up":
			_Hit(180)
		last_hit_time = Time.get_ticks_msec()
		
	elif area.name == "Speil_Hitbox9":
		rect_shape1 = 9
		_Hit(180) # or whatever bounce angle you need
	elif area.name == "Speil_Hitbox10":
		rect_shape1 = 10
		_Hit(90) # or whatever bounce angle you need
	$Timer.start() # restart lifetime timer

func _Hit(angle_change):
	var rect = RectangleShape2D.new()

	# Convert angle to radians
	 # Convert degrees to radians and ADD it to the current rotation
	rotation += deg_to_rad(angle_change)

	# Apply new movement
	linear_velocity = Vector2.RIGHT.rotated(rotation) * speed

	# Update hitbox rotation
	$Area2D/CollisionShape2D.rotation = rotation

	# 2️⃣ Rotate sprite to match hitbox
	

	# Update hitbox size based on shape and direction
	if rect_shape1 == 1:
		if global.direction == "right":
			rect.extents = Vector2(16,4)
			anim.play("Left")
		elif global.direction == "up":
			rect.extents = Vector2(4,16)
			anim.play("Left")
		elif global.direction == "left":
			rect.extents = Vector2(4,16)
			anim.play("Left")
		elif global.direction == "down":
			rect.extents = Vector2(4,16)
			anim.play("Left")
		rect.extents = Vector2(4,16)
		
	elif rect_shape1 == 2:
		if global.direction == "up":
			rect.extents = Vector2(4,16)
			anim.play("up")
		elif global.direction == "left":
			rect.extents = Vector2(16,4)
			anim.play("up")
	elif rect_shape1 == 3:
		rect.extents = Vector2(16,4)
	elif rect_shape1 == 4:
		rect.extents = Vector2(16,4)
	elif rect_shape1 == 5:
		if global.direction == "right":
			rect.extents = Vector2(16,4)
			anim.play("up")
		elif global.direction == "up":
			rect.extents = Vector2(4,16)
			anim.play("up")
		elif global.direction == "left":
			rect.extents = Vector2(4,16)
			anim.play("up")
		elif global.direction == "down":
			rect.extents = Vector2(4,16)
			anim.play("up")
	elif rect_shape1 == 6:
		if global.direction == "down":
			rect.extents = Vector2(4,16)
	elif rect_shape1 == 7:
		if global.direction == "right":
			rect.extents = Vector2(16,4)
			anim.play("Left")
		elif global.direction == "up":
			rect.extents = Vector2(4,16)
			anim.play("Left")
		elif global.direction == "left":
			rect.extents = Vector2(4,16)
			anim.play("Left")
		elif global.direction == "down":
			rect.extents = Vector2(4,16)
			anim.play("Left")
	elif rect_shape1 == 8:
		if global.direction == "right":
			rect.extents = Vector2(16,4)
			anim.play("up")
		elif global.direction == "down":
			rect.extents = Vector2(4,16)
			anim.play("up")
	if rect_shape1 == 9:
		anim.play("Left")
	if rect_shape1 == 10:
		anim.play("up")
	$Area2D/CollisionShape2D.shape = rect

func _on_timer_timeout():
	queue_free()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "Hurtbox":
		queue_free()
	if area.name == "Monster":
		queue_free()
