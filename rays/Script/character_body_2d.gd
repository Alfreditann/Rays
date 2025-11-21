extends CharacterBody2D

var currpos = [0,0]
var speed = 200




func _physics_process(delta: float) -> void:
	var move_direction = Vector2.ZERO

	if Input.is_action_just_released("move_rigth"):
		currpos[0] += 128
		get_node("Sprite2D").look_at(self.position + Vector2(0,-1))
	elif Input.is_action_just_released("move_left"):
		currpos[0] -= 128
		get_node("Sprite2D").look_at(self.position + Vector2(0,1))
	elif Input.is_action_just_released("move_up"):
		currpos[1] -= 128
		get_node("Sprite2D").look_at(self.position + Vector2(-1,0))
	elif Input.is_action_just_released("move_down"):
		currpos[1] += 128
		get_node("Sprite2D").look_at(self.position + Vector2(1,0))
	self.position = Vector2(currpos[0], currpos[1])
	if Input.is_action_just_released("ui_right"):
		get_node("Sprite2D").look_at(self.position + Vector2(0,-1))
	elif Input.is_action_just_released("ui_left"):
		get_node("Sprite2D").look_at(self.position + Vector2(0,1))
	elif Input.is_action_just_released("ui_up"):
		get_node("Sprite2D").look_at(self.position + Vector2(-1,0))
	elif Input.is_action_just_released("ui_down"):
		get_node("Sprite2D").look_at(self.position + Vector2(1,0))
	
	
