extends CharacterBody2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 200

func get_input() -> Vector2:
	var input = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	return input.normalized()

func _physics_process(delta):
	var playerInput = get_input()
	velocity = playerInput * SPEED
	move_and_slide()

	play_anim(playerInput)


func play_anim(dir: Vector2):
	if dir == Vector2.ZERO:
		if anim.animation.begins_with("walk"):
			anim.animation = anim.animation.replace("walk", "idle")
		anim.play()
		return


	if abs(dir.x) > abs(dir.y):
		anim.animation = "walk"
		anim.flip_h = dir.x < 0
	else:
		anim.flip_h = false
		anim.animation = "walk_down" if dir.y > 0 else "walk_up"

	anim.play()
