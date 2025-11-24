extends CharacterBody2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var raycast: RayCast2D = $RayCast2D

var is_moving: bool = false
var move_dir: Vector2 = Vector2.ZERO
var move_distance: float
var target_position: Vector2


func _ready():
	# Get sprite width/height (character size)
	move_distance = anim.sprite_frames.get_frame_texture(anim.animation, 0).get_size().x
	target_position = position


func update_raycast():
	raycast.target_position = move_dir * 40


func _physics_process(delta: float) -> void:

	# If currently moving, interpolate movement
	if is_moving:
		position = position.lerp(target_position, delta * 10)

		# Stop when close enough
		if position.distance_to(target_position) < 1:
			position = target_position
			is_moving = false
		return


	# --- HANDLE INPUT ONLY WHEN NOT MOVING ---
	if Input.is_action_just_pressed("move_rigth") or Input.is_action_just_pressed("ui_right"):
		move_dir = Vector2.RIGHT
		anim.play("Rigth")

	elif Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("ui_left"):
		move_dir = Vector2.LEFT
		anim.play("Left")

	elif Input.is_action_just_pressed("move_up") or Input.is_action_just_pressed("ui_up"):
		move_dir = Vector2.UP
		anim.play("Back")

	elif Input.is_action_just_pressed("move_down") or Input.is_action_just_pressed("ui_down"):
		move_dir = Vector2.DOWN
		anim.play("Front")
	else:
		return  # no input, do nothing


	# Set a new movement step
	target_position = position + move_dir * move_distance
	is_moving = true

	# Rotate character and align raycast
	rotation = move_dir.angle()
	update_raycast()
