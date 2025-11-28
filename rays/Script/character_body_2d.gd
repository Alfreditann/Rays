extends CharacterBody2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var raycast: RayCast2D = $RayCast2D
var tile_size := 32
var moving := false
var speed := 200
var is_moving: bool = false
var move_dir: Vector2 = Vector2.ZERO
var move_distance: float
var target_position: Vector2
var speed = 200
var tile_size = 32

func _ready():
	# Get sprite width/height (character size)
	move_distance = anim.sprite_frames.get_frame_texture(anim.animation, anim.frame).get_size().x
	target_position = position

#func update_raycast():
	##raycast.cast_to = move_dir.normalized() * 40.0

func _physics_process(delta: float) -> void:

	# If currently moving, interpolate movement
	if is_moving:
		position = position.lerp(target_position, delta * 30)

		if position.distance_to(target_position) < 1:
			position = target_position
			is_moving = false
		return

	# --- INPUT ---
	if Input.is_action_pressed("move_right") or Input.is_action_pressed("ui_right"):
		move_dir = Vector2.RIGHT
		global.direction = "right"
		anim.play("Right")

	elif Input.is_action_pressed("move_left") or Input.is_action_pressed("ui_left"):
		move_dir = Vector2.LEFT
		global.direction = "left"
		anim.play("Left")

	elif Input.is_action_pressed("move_up") or Input.is_action_pressed("ui_up"):
		move_dir = Vector2.UP
		global.direction = "up"
		anim.play("Back")

	elif Input.is_action_pressed("move_down") or Input.is_action_pressed("ui_down"):
		move_dir = Vector2.DOWN
		global.direction = "down"
		anim.play("Front")
	else:
		return
		
	target_position = global_position + move_dir * tile_size
	moving = true

func move_grid(delta):
	if not moving:
		return
	var delta_vec = target_position - global_position
	var motion = delta_vec
	if delta_vec.length() > speed * delta:
		motion = delta_vec.normalized() * speed * delta

		var collision = move_and_collide(motion)
		if collision:
			var body = collision.get_collider()
			if body is RigidBody2D:
		# Only allow horizontal pushes
				if move_dir == Vector2.LEFT or move_dir == Vector2.RIGHT:
					var player_pos = global_position
					var block_pos = body.global_position
			# Only push if player is on the side
					if (move_dir == Vector2.RIGHT and player_pos.x < block_pos.x) or \
					(move_dir == Vector2.LEFT and player_pos.x > block_pos.x):
						var push_target = block_pos + Vector2(move_dir.x * tile_size, 0)
				# Check if space is free
						var space_state = get_world_2d().direct_space_state
						var point_query = PhysicsPointQueryParameters2D.new()
						point_query.position = push_target
						point_query.collide_with_bodies = true
						point_query.collide_with_areas = false
						var result = space_state.intersect_point(point_query)
						if result.size() == 0:
							body.linear_velocity = move_dir * 200

	# Stop player movement if blocked
		moving = false
		target_position = global_position
		return

	if global_position.distance_to(target_position) < 0.1:
		global_position = target_position
		moving = false


	
	#if not moving:
		#return
	##Smooth movment
	#global_position = global_position.move_toward(target_position, 200 * delta)
		##Reached destination
	#if global_position == target_position:
		#moving = false
		
func push_rigidbody_objects():
	if not moving:
		return
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var body = collision.get_collider()
		if body is RigidBody2D:
			if move_dir == Vector2.LEFT or move_dir == Vector2.RIGHT:
				var can_push := true  # you can still check for free space if needed
				if can_push:
			# Add a sideways push
					body.apply_impulse(move_dir * 150)


			
			
			
			
			
		#if Input.is_action_just_released("move_rigth"):
		#currpos[0] += 32
		##get_node("AnimatedSprite2D").
		#look_at(self.position + Vector2(0,0))
		#anim.play("Rigth")
	#elif Input.is_action_just_released("move_left"):
		#currpos[0] -= 32
		##get_node("AnimatedSprite2D").
		#look_at(self.position + Vector2(0,0))
		#anim.play("Left")
	#elif Input.is_action_just_released("move_up"):
		#currpos[1] -= 32
		##get_node("AnimatedSprite2D").
		#look_at(self.position + Vector2(0,0))
		#anim.play("Back")
	#elif Input.is_action_just_released("move_down"):
		#currpos[1] += 32
		##get_node("AnimatedSprite2D").
		#look_at(self.position + Vector2(0,0))
		#anim.play("Front")
	#self.position = Vector2(currpos[0], currpos[1])
	#if Input.is_action_just_released("ui_right"):
		#get_node("AnimatedSprite2D").look_at(self.position + Vector2(0,-1))
	#elif Input.is_action_just_released("ui_left"):
		#get_node("AnimatedSprite2D").look_at(self.position + Vector2(0,1))
	#elif Input.is_action_just_released("ui_up"):
		#get_node("SprAnimatedSprite2D").look_at(self.position + Vector2(-1,0))
	#elif Input.is_action_just_released("ui_down"):
		#get_node("AnimatedSprite2D").look_at(self.position + Vector2(1,0))
