extends CharacterBody2D

var currpos = [0,0]
@onready var anim = $AnimatedSprite2D


var tile_size := 32
var move_direction := Vector2.ZERO
var target_position := Vector2.ZERO
var moving := false

func _ready():
	target_position = global_position

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
	#Smooth movment
	global_position = global_position.move_toward(target_position, 200 * delta)
		#Reached destination
	if global_position == target_position:
		moving = false
		
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
