extends CharacterBody2D

var currpos = [0,0]
@onready var anim = $AnimatedSprite2D

var interactable_object: CharacterBody2D = null

func _ready():
	currpos = position

func _physics_process(delta: float) -> void:
	handle_movement()
	handle_interaction()
	
func handle_movement():
	if Input.is_action_just_released("move_rigth"):
		currpos[0] += 32
		#get_node("AnimatedSprite2D").
		look_at(self.position + Vector2(0,0))
		anim.play("Rigth")
	elif Input.is_action_just_released("move_left"):
		currpos[0] -= 32
		#get_node("AnimatedSprite2D").
		look_at(self.position + Vector2(0,0))
		anim.play("Left")
	elif Input.is_action_just_released("move_up"):
		currpos[1] -= 32
		#get_node("AnimatedSprite2D").
		look_at(self.position + Vector2(0,0))
		anim.play("Back")
	elif Input.is_action_just_released("move_down"):
		currpos[1] += 32
		#get_node("AnimatedSprite2D").
		look_at(self.position + Vector2(0,0))
		anim.play("Front")
	self.position = Vector2(currpos[0], currpos[1])
	if Input.is_action_just_released("ui_right"):
		get_node("AnimatedSprite2D").look_at(self.position + Vector2(0,-1))
	elif Input.is_action_just_released("ui_left"):
		get_node("AnimatedSprite2D").look_at(self.position + Vector2(0,1))
	elif Input.is_action_just_released("ui_up"):
		get_node("SprAnimatedSprite2D").look_at(self.position + Vector2(-1,0))
	elif Input.is_action_just_released("ui_down"):
		get_node("AnimatedSprite2D").look_at(self.position + Vector2(1,0))
	
func handle_interaction():
	if Input.is_action_just_pressed("interact") and interactable_object:
		var direction = (interactable_object.global_position - global_position).normalized()
		
		if abs(direction.x) > abs(direction.y):
			direction = Vector2(sign(direction.x), 0)
		else:
			direction = Vector2(0, sign(direction.y))
			
		interactable_object.push(direction)
		
func _on_player_body_entered(body: Node2D) -> void:
	if body.is_in_group("Interactable"):
		interactable_object = body


func _on_player_body_exited(body: Node2D) -> void:
	if body == interactable_object:
		interactable_object = null
