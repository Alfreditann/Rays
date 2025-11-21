extends CharacterBody2D

var currpos = [0,0]
@onready var anim = $AnimatedSprite2D



func _physics_process(delta: float) -> void:

	if Input.is_action_just_released("move_rigth"):
		currpos[0] += 128
		#get_node("AnimatedSprite2D").
		look_at(self.position + Vector2(0,0))
		anim.play("Rigth")
	elif Input.is_action_just_released("move_left"):
		currpos[0] -= 128
		#get_node("AnimatedSprite2D").
		look_at(self.position + Vector2(0,0))
		anim.play("Left")
	elif Input.is_action_just_released("move_up"):
		currpos[1] -= 128
		#get_node("AnimatedSprite2D").
		look_at(self.position + Vector2(0,0))
		anim.play("Back")
	elif Input.is_action_just_released("move_down"):
		currpos[1] += 128
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
	
