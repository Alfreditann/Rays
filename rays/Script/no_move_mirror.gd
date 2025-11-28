# Mirror.gd
extends StaticBody2D

@onready var mirror: Sprite2D = $Sprite2D
@onready var hitbox: Area2D = $Hitbox
@onready var collision_shape: CollisionShape2D = $Hitbox/CollisionShape2D

# This version only uses the "mirror seven" orientation
var hitbox_position := Vector2(0, -18)
var hitbox_size := Vector2(10, 64) # same as your mirror seven shape

func _ready():
	# Setup hitbox once
	collision_shape.shape = RectangleShape2D.new()
	collision_shape.shape.extents = hitbox_size / 2
	hitbox.position = hitbox_position
