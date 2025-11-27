extends StaticBody2D

@onready var mirror: AnimatedSprite2D = $Mirror
@onready var activate_radius: Area2D = $Activate_Radius
@onready var get_speil = $Speil_Hitbox

var directions = ["first mirror", "second mirror", "third mirror", "fourth mirror", "mirror five", "mirror six", "mirror seven", "mirror eigth"]
var current_index = 0

var testdDirection =[Vector2(1,0),Vector2(35,-40),Vector2(32,-37),Vector2(-38,-40), Vector2(32,-35), Vector2(-2,-40), Vector2(-28,-25), Vector2(-30,-33)]
var directionCounter = 0

func _ready() -> void:
	set_process_input(false)

func _process(delta: float) -> void:
	pass

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
		print("hei")
		if event.button_index == MOUSE_BUTTON_LEFT:
			
			current_index = (current_index + 1) % directions.size()
			if current_index == 0:
				get_speil.position = testdDirection[current_index]
				get_speil.name = "Speil_Hitbox"
			elif current_index == 1:
				get_speil.position = testdDirection[current_index]
				get_speil.name = "Speil_Hitbox2"
			elif current_index == 2:
				get_speil.position = testdDirection[current_index]
				get_speil.name = "Speil_Hitbox3"
			elif current_index == 3:
				get_speil.position = testdDirection[current_index]
				get_speil.name = "Speil_Hitbox4"
			elif current_index == 4:
				get_speil.position = testdDirection[current_index]
				get_speil.name = "Speil_Hitbox5"
			elif current_index == 5:
				get_speil.position = testdDirection[current_index]
				get_speil.name = "Speil_Hitbox6"
			elif current_index == 6:
				get_speil.position = testdDirection[current_index]
				get_speil.name = "Speil_Hitbox7"
			elif current_index == 7:
				get_speil.position = testdDirection[current_index]
				get_speil.name = "Speil_Hitbox8"
			elif current_index == 8:
				get_speil.position = testdDirection[current_index]
				get_speil.name = "Speil_Hitbox4"
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
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			
			current_index = (current_index - 1 + directions.size()) % directions.size()

			if current_index == 0:
				get_speil.position = testdDirection[current_index]
				get_speil.name = "Speil_Hitbox"
			elif current_index == 1:
				get_speil.position = testdDirection[current_index]
				get_speil.name = "Speil_Hitbox2"
			elif current_index == 2:
				get_speil.position = testdDirection[current_index]
				get_speil.name = "Speil_Hitbox3"
			elif current_index == 3:
				get_speil.position = testdDirection[current_index]
				get_speil.name = "Speil_Hitbox4"
			elif current_index == 4:
				get_speil.position = testdDirection[current_index]
				get_speil.name = "Speil_Hitbox5"
			elif current_index == 5:
				get_speil.position = testdDirection[current_index]
				get_speil.name = "Speil_Hitbox6"
			elif current_index == 6:
				get_speil.position = testdDirection[current_index]
				get_speil.name = "Speil_Hitbox7"
			elif current_index == 7:
				get_speil.position = testdDirection[current_index]
				get_speil.name = "Speil_Hitbox8"
			elif current_index == 8:
				get_speil.position = testdDirection[current_index]
				get_speil.name = "Speil_Hitbox4"

	mirror.play(directions[current_index])
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

func _on_area_2d_area_entered(area: Area2D) -> void:
	emit_signal("speilHit")
