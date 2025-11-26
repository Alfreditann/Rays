extends StaticBody2D

@onready var mirror: AnimatedSprite2D = $Mirror
@onready var activate_radius: Area2D = $Activate_Radius
@onready var get_speil = $Speil_Hitbox

var directions = ["first mirror", "second mirror", "third mirror", "fourth mirror", "mirror five"]
var current_index = 0

var testdDirection =[Vector2(32,0),Vector2(32,32),Vector2(0,32),Vector2(0,0)]
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
		if event.button_index == MOUSE_BUTTON_LEFT:
			current_index = (current_index + 1) % directions.size()

			if get_speil.name == "Speil_Hitbox":
				get_speil.position = testdDirection[directionCounter]
				get_speil.name = "Speil_Hitbox2"
				directionCounter += 1

			elif get_speil.name == "Speil_Hitbox2":
				get_speil.position = testdDirection[directionCounter]
				get_speil.name = "Speil_Hitbox3"
				directionCounter += 1

			elif get_speil.name == "Speil_Hitbox3":
				get_speil.position = testdDirection[directionCounter]
				get_speil.name = "Speil_Hitbox4"
				directionCounter += 1

			elif get_speil.name == "Speil_Hitbox4":
				get_speil.position = testdDirection[directionCounter]
				get_speil.name = "Speil_Hitbox"
				directionCounter += 1


			if directionCounter > 3:
				directionCounter = 0



		elif event.button_index == MOUSE_BUTTON_RIGHT:
			current_index = (current_index - 1) % directions.size()

			if get_speil.name == "Speil_Hitbox":
				get_speil.position = testdDirection[directionCounter]
				get_speil.name = "Speil_Hitbox4"
				directionCounter -= 1

			elif get_speil.name == "Speil_Hitbox2":
				get_speil.position = testdDirection[directionCounter]
				get_speil.name = "Speil_Hitbox"
				directionCounter -= 1

			elif get_speil.name == "Speil_Hitbox3":
				get_speil.position = testdDirection[directionCounter]
				get_speil.name = "Speil_Hitbox2"
				directionCounter -= 1

			elif get_speil.name == "Speil_Hitbox4":
				get_speil.position = testdDirection[directionCounter]
				get_speil.name = "Speil_Hitbox3"
				directionCounter -= 1

			if directionCounter < 0:
				directionCounter = 3

	mirror.play(directions[current_index])

func _on_area_2d_area_entered(area: Area2D) -> void:
	emit_signal("speilHit")
