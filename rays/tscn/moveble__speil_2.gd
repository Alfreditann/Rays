extends CharacterBody2D

var move_distance := 32

func push(direction: Vector2):
		position += direction * move_distance
