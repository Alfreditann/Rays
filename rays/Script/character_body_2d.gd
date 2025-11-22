extends CharacterBody2D

var currpos = [0,0]
@onready var anim = $AnimatedSprite2D

@onready var mirror = get_parent().get_node("../Moveble_Speil2")

var interactable_object: CharacterBody2D = null

func _ready():
	currpos = position

func _process(delta):
	handle_movement()
	handle_mirror_push()
	
func handle_movement():
	var target_pos = currpos
	
	if Input.is_action_just_released("move_rigth"):
		target_pos.x += 32
		anim.play("Rigth")
	elif Input.is_action_just_released("move_left"):
		target_pos.x -= 32
		anim.play("Left")
	elif Input.is_action_just_released("move_up"):
		target_pos.y -= 32
		anim.play("Back")
	elif Input.is_action_just_released("move_down"):
		target_pos.y += 32
		anim.play("Front")
		
	# Only move if no collision
	if can_move_to(target_pos):
		currpos = target_pos
		position = currpos

func can_move_to(target_pos: Vector2) -> bool:
	var space_state = get_world_2d().direct_space_state
	var query = PhysicsPointQueryParameters2D.new()
	query.position = target_pos
	query.collide_with_bodies = true
	query.exclude = [self]
	
	var result = space_state.intersect_point(query)
	return result.empty()
	
func handle_mirror_push():
	if Input.is_action_just_pressed("interact"):
		# Push mirror right by default
		mirror.push(Vector2(1,0))

#func _physics_process(delta: float) -> void:
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
