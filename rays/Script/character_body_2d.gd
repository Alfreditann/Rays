extends CharacterBody2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var raycast: RayCast2D = $RayCast2D

var is_moving: bool = false
var move_direction: Vector2 = Vector2.ZERO
var move_distance: float
var target_position: Vector2

var tile_size := 32
var moving := false

func _ready():
	# Get sprite width/height (character size)
	move_distance = anim.sprite_frames.get_frame_texture(anim.animation, 0).get_size().x
	target_position = position
	target_position = global_position


func update_raycast():
	raycast.target_position = move_direction * 40



func _physics_process(delta: float) -> void:
	handle_input()
	move_grid(delta)
	push_rigidbody_objects()
	
func handle_input():
	if moving:
		return
	if Input.is_action_pressed("move_rigth"):
		move_direction = Vector2.RIGHT
		anim.play("Rigth")
	elif Input.is_action_pressed("move_left"):
		move_direction = Vector2.LEFT
		anim.play("Left")
	elif Input.is_action_pressed("move_up"):
		move_direction = Vector2.UP
		anim.play("Back")
	elif Input.is_action_pressed("move_down"):
		move_direction = Vector2.DOWN
		anim.play("Front")
	else:
		return
		
	target_position = global_position + move_direction * tile_size
	moving = true

func move_grid(delta):
	if not moving:
		return

	var delta_vec = target_position - global_position
	var max_distance = 200 * delta
	var motion = delta_vec
	if delta_vec.length() > max_distance:
		motion = delta_vec.normalized() * max_distance

	var collision = move_and_collide(motion)
	if collision:
		var body = collision.get_collider()
		if body is RigidBody2D:
			# Attempt to move the rigidbody one tile in the push direction
			var push_target = body.global_position + move_direction * tile_size

			# Check if the push target is free
			# Check if the push target is free using PhysicsPointQueryParameters2D
			var space_state = get_world_2d().direct_space_state
			var point_query = PhysicsPointQueryParameters2D.new()
			point_query.position = push_target
			point_query.collide_with_bodies = true
			point_query.collide_with_areas = false

			var result = space_state.intersect_point(point_query)
			if result.size() == 0:
				# Move the rigid body one tile
				body.global_position = push_target

		# Stop movement if blocked by wall or object
		moving = false
		target_position = global_position
		return

	# Check if we've reached the target tile
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
			var  push_force := 20.0
			body.apply_impulse(move_direction * push_force)
			
			
			
			
			
			
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
