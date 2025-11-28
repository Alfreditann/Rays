# Mirror.gd
extends StaticBody2D

@onready var mirror: Sprite2D = $Sprite2D
@onready var hitbox: Area2D = $Hitbox
@onready var collision_shape1: CollisionShape2D = $Speil_Hitbox10/CollisionShape2D

# This version only uses the "mirror seven" orientation
var hitbox_position := Vector2(0, -18)
var hitbox_size := Vector2(10, 64) # same as your mirror seven shape

func _ready():
	# Setup hitbox once
	collision_shape1.shape = RectangleShape2D.new()
	collision_shape1.shape.extents = hitbox_size / 2
