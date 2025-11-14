extends AnimatedSprite2D

@onready var collision = $CollisionShape2D

var mirror_data = {
	"first mirror": {"shape": RectangleShape2D.new(), "position": Vector2(596, 310.5)},
	"second mirror": {"shape": RectangleShape2D.new(), "position": Vector2(596, 310.5)},
	"third mirror": {"shape": RectangleShape2D.new(), "position": Vector2(596, 310.5)},
	"fourth mirror": {"shape": RectangleShape2D.new(), "position": Vector2(596, 310.5)}
}

var directions = ["first mirror", "second mirror", "third mirror", "fourth mirror"]
var current_index = 0

func ready():
	shapes["first mirror"].position= Vector2(596, 310.5)
	shapes["second mirror"]
	current_index = directions.find(animation)
	if current_index == -1:
		current_index = 0
		play(directions[current_index])
	
func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		current_index += 1
	if current_index >= directions.size():
		current_index = 0
	elif event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_RIGHT:
		current_index -= 1
		if current_index >= directions.size():
			current_index = 3
	play(directions[current_index])
