extends AnimatedSprite2D

var fireball = preload("res://tscn/rigid_body_2d.tscn")
var pos = Vector2(1,0)
var is_ready: bool =true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
		

# Called every frame. 'delta' is the elapsed time since the previous frame. 
func _process(_float):
	#$Timer.time_left = 0
	#if $Timer.time_left <= 0 :
	
	if Input.is_action_just_released("move_right") || Input.is_action_just_released("ui_right"):
		pos = Vector2(1,0)
	elif Input.is_action_just_released("move_left") || Input.is_action_just_released("ui_left"):

		pos = Vector2(-1,0)
	elif Input.is_action_just_released("move_up")|| Input.is_action_just_released("ui_up"):

		pos = Vector2(0,-1)
	elif Input.is_action_just_released("move_down")|| Input.is_action_just_released("ui_down"):

		pos = Vector2(0,1)
	if Input.is_action_just_pressed("shoot") and is_ready:
		is_ready = false
		$ShootCooldown.start()

		var instance = fireball.instantiate()

		# Spawn slightly in front of the shooter to avoid immediate overlap collision
		var muzzle_offset = 16  # tweak to taste (in pixels)
		instance.global_position = global_position + pos * muzzle_offset

		# Set exact rotation from direction vector
		instance.rotation = pos.angle()

		# Add to scene first (recommended), then set velocity
		get_tree().current_scene.add_child(instance)

		# Optionally prevent colliding with the player
		# The shooter node is AnimatedSprite2D; the player's root is likely its parent (CharacterBody2D)
		if get_parent() != null and get_parent() is PhysicsBody2D:
			instance.add_collision_exception_with(get_parent())

		# Now compute and apply linear_velocity
		# Use the helper function from the bullet (preferred)
		if "start_motion" in instance:
			instance.start_motion()
		else:
			# fallback: set linear_velocity directly (if the bullet has `speed`)
			var s = 400.0
			if "speed" in instance:
				s = instance.speed
			instance.linear_velocity = Vector2.RIGHT.rotated(instance.rotation).normalized() * s

		# Debug:
	





func _on_shoot_cooldown_timeout() -> void:
	is_ready = true
