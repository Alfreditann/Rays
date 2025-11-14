extends AnimatedSprite2D

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		frame += 1
	if frame == 4:
		frame = 0
