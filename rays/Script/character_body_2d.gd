extends CharacterBody2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
#@onready var raycast: RayCast2D = $RayCast2D

var is_moving: bool = false
var move_dir: Vector2 = Vector2.ZERO
var move_distance: float
var target_position: Vector2

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
		anim.play("Right")

	elif Input.is_action_pressed("move_left") or Input.is_action_pressed("ui_left"):
		move_dir = Vector2.LEFT
		anim.play("Left")

	elif Input.is_action_pressed("move_up") or Input.is_action_pressed("ui_up"):
		move_dir = Vector2.UP
		anim.play("Back")

	elif Input.is_action_pressed("move_down") or Input.is_action_pressed("ui_down"):
		move_dir = Vector2.DOWN
		anim.play("Front")
	else:
		return

	# Move one tile
	target_position = position + move_dir * move_distance
	is_moving = true

	# Update raycast
	#update_raycast()
