extends Sprite2D

var fireball = preload("res://tscn/rigid_body_2d.tscn")
var pos = Vector2(1,0)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
		


# Called every frame. 'delta' is the elapsed time since the previous frame. 
func _process(delta):
	#$Timer.time_left = 0
	#if $Timer.time_left <= 0 :
	
	if Input.is_action_just_released("move_rigth") || Input.is_action_just_released("ui_right"):
		pos = Vector2(1,0)
	elif Input.is_action_just_released("move_left") || Input.is_action_just_released("ui_left"):

		pos = Vector2(-1,0)
	elif Input.is_action_just_released("move_up")|| Input.is_action_just_released("ui_up"):

		pos = Vector2(0,-1)
	elif Input.is_action_just_released("move_down")|| Input.is_action_just_released("ui_down"):

		pos = Vector2(0,1)
	if Input.is_action_just_pressed("ui_accept"):
			var instance = fireball.instantiate()
			instance.look_at(self.position + pos)
			instance.global_position = Vector2(global_position)
			get_tree().current_scene.add_child(instance)
			#$Timer.wait_time = 1
			#$Timer.start()
	#else:
		#pass
	
	
	
