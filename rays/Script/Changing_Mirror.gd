extends StaticBody2D

@onready var mirror: AnimatedSprite2D = $Mirror
@onready var activate_radius: Area2D = $Activate_Radius
@onready var get_speil = $Speil_Hitbox
@onready var change_hurtbox = $Hurtbox/CollisionShape2D

var directions = ["first mirror", "second mirror", "third mirror", "fourth mirror", "mirror five", "mirror six", "mirror seven", "mirror eigth"]
var current_index = 0


var testdDirection =[Vector2(1,0),Vector2(3,-13),Vector2(15,-18),Vector2(-18,-15), Vector2(0,-16), Vector2(0,-28), Vector2(0,-18), Vector2(0,-18)]
var directionCounter = 0

func _ready() -> void:
	set_process_input(false)
	change_hurtbox.shape.size.y = 30
	change_hurtbox.position.y = change_hurtbox.position.y-27

func _on_activate_radius_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		set_process_input(true)

func _on_activate_radius_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		set_process_input(false)

func _input(event) -> void:
	if not is_processing_input():
		return

	if event is InputEventMouseButton and event.pressed:
		var rect = RectangleShape2D.new()
		print("hei")
		if event.button_index == MOUSE_BUTTON_LEFT:
			
			current_index = (current_index + 1) % directions.size()
			if current_index == 0:
				get_speil.position = testdDirection[current_index]
				get_speil.name = "Speil_Hitbox"
				change_hurtbox.shape.size.y = 30
				change_hurtbox.position.y = change_hurtbox.position.y-27
			elif current_index == 1:
				get_speil.position = testdDirection[current_index]
				get_speil.name = "Speil_Hitbox2"
				print(change_hurtbox.shape.size)
				#rect.extents= Vector2(25,16)
				#change_hurtbox.shape = rect
				change_hurtbox.shape.size.x = 30
				change_hurtbox.shape.size.y = 64
				
				change_hurtbox.position.x = change_hurtbox.position.x -27
				change_hurtbox.position.y = change_hurtbox.position.y + 25
				
			elif current_index == 2:
				get_speil.position = testdDirection[current_index]
				get_speil.name = "Speil_Hitbox3"
				change_hurtbox.position.x = change_hurtbox.position.x +10
			elif current_index == 3:
				get_speil.position = testdDirection[current_index]
				get_speil.name = "Speil_Hitbox4"
				change_hurtbox.position.x = change_hurtbox.position.x +30
			elif current_index == 4:
				get_speil.position = testdDirection[current_index]
				get_speil.name = "Speil_Hitbox5"
				change_hurtbox.position.x = change_hurtbox.position.x +10
				change_hurtbox.shape.size.x = 10
			elif current_index == 5:
				get_speil.position = testdDirection[current_index]
				get_speil.name = "Speil_Hitbox6"
				change_hurtbox.position.x = change_hurtbox.position.x -20
				change_hurtbox.position.y = change_hurtbox.position.y + 25
				change_hurtbox.shape.size.y = 30
				change_hurtbox.shape.size.x = 64
			elif current_index == 6:
				get_speil.position = testdDirection[current_index]
				get_speil.name = "Speil_Hitbox7"
				change_hurtbox.shape.size.y = 64
				change_hurtbox.shape.size.x = 10
				change_hurtbox.position.x = change_hurtbox.position.x -20
				change_hurtbox.position.y = change_hurtbox.position.y - 20
			elif current_index == 7:
				get_speil.position = testdDirection[current_index]
				get_speil.name = "Speil_Hitbox8"
				change_hurtbox.position.x = change_hurtbox.position.x +40
			#if get_speil.name == "Speil_Hitbox":
				#get_speil.position = testdDirection[directionCounter]
				#get_speil.name = "Speil_Hitbox2"
				#directionCounter += 1
#
			#elif get_speil.name == "Speil_Hitbox2":
				#get_speil.position = testdDirection[directionCounter]
				#get_speil.name = "Speil_Hitbox3"
				#directionCounter += 1
#
			#elif get_speil.name == "Speil_Hitbox3":
				#get_speil.position = testdDirection[directionCounter]
				#get_speil.name = "Speil_Hitbox4"
				#directionCounter += 1
#
			#elif get_speil.name == "Speil_Hitbox4":
				#get_speil.position = testdDirection[directionCounter]
				#get_speil.name = "Speil_Hitbox"
				#directionCounter += 1
#
#
			#if directionCounter > 3:
				#directionCounter = 0
#
#
#
		#elif event.button_index == MOUSE_BUTTON_RIGHT:
			#current_index = (current_index - 1 + directions.size()) % directions.size()
#
			## IMPORTANT: Reset first so movement does NOT stack
			#change_hurtbox.position = Vector2.ZERO
			#change_hurtbox.shape.size = Vector2(30, 30)
#
			#if current_index == 0:
				#get_speil.position = testdDirection[current_index]
				#get_speil.name = "Speil_Hitbox"
				#change_hurtbox.shape.size.y = 30
				#change_hurtbox.position.y -= 27
#
			#elif current_index == 1:
				#get_speil.position = testdDirection[current_index]
				#get_speil.name = "Speil_Hitbox2"
				#change_hurtbox.shape.size.x = 30
				#change_hurtbox.shape.size.y = 64
				#change_hurtbox.position.x -= 27
				#change_hurtbox.position.y += 25
#
			#elif current_index == 2:
				#get_speil.position = testdDirection[current_index]
				#get_speil.name = "Speil_Hitbox3"
				#change_hurtbox.position.x += 10
#
			#elif current_index == 3:
				#get_speil.position = testdDirection[current_index]
				#get_speil.name = "Speil_Hitbox4"
				#change_hurtbox.position.x += 30
#
			#elif current_index == 4:
				#get_speil.position = testdDirection[current_index]
				#get_speil.name = "Speil_Hitbox5"
				#change_hurtbox.position.x += 10
				#change_hurtbox.shape.size.x = 10
#
			#elif current_index == 5:
				#get_speil.position = testdDirection[current_index]
				#get_speil.name = "Speil_Hitbox6"
				#change_hurtbox.position.x -= 20
				#change_hurtbox.position.y += 25
				#change_hurtbox.shape.size.y = 30
				#change_hurtbox.shape.size.x = 64
#
			#elif current_index == 6:
				#get_speil.position = testdDirection[current_index]
				#get_speil.name = "Speil_Hitbox7"
				#change_hurtbox.shape.size.y = 64
				#change_hurtbox.shape.size.x = 10
				#change_hurtbox.position.x -= 20
				#change_hurtbox.position.y -= 20
#
			#elif current_index == 7:
				#get_speil.position = testdDirection[current_index]
				#get_speil.name = "Speil_Hitbox8"
				#change_hurtbox.position.x += 40
#
			#mirror.play(directions[current_index])

	#
				#if get_speil.name == "Speil_Hitbox":
					#get_speil.position = testdDirection[directionCounter]
					#get_speil.name = "Speil_Hitbox4"
					#directionCounter -= 1
	#
				#elif get_speil.name == "Speil_Hitbox2":
					#get_speil.position = testdDirection[directionCounter]
					#get_speil.name = "Speil_Hitbox"
					#directionCounter -= 1
	#
				#elif get_speil.name == "Speil_Hitbox3":
					#get_speil.position = testdDirection[directionCounter]
					#get_speil.name = "Speil_Hitbox2"
					#directionCounter -= 1
	#
				#elif get_speil.name == "Speil_Hitbox4":
					#get_speil.position = testdDirection[directionCounter]
					#get_speil.name = "Speil_Hitbox3"
					#directionCounter -= 1

				#if directionCounter < 0:
					#directionCounter = 3

	mirror.play(directions[current_index])

func _on_area_2d_area_entered(_area: Area2D) -> void:
	emit_signal("speilHit")
