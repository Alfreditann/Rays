extends RigidBody2D

@onready var hitbox = $"Player/Speil_Hitbox"
var speed := 500
var has_hit := false

func _ready():
	linear_velocity = Vector2.RIGHT.rotated(rotation) * speed

	# Connect Area2D collision
	$Area2D.area_entered.connect(_on_area_entered)

func _on_area_entered(area):
	if area.name == ("Speil_Hitbox"):
	
		$Timer.wait_time = 3
		$Timer.start()
		print("Hit detected!") # Debug
		_Hit()


func _Hit():
	var rect = RectangleShape2D.new()
	if has_hit:
		return

	#has_hit = true

	# Change trajectory onceS
	rotation += deg_to_rad(90)
	linear_velocity = Vector2.RIGHT.rotated(rotation) * speed
	
	
	# Rotate sprite to match new direction
	$Sprite2D.rotation = rotation
	rect.extents = Vector2(4,16)
	$Area2D/CollisionShape2D.shape = rect

	# Disable further collisionsS
	$Area2D.disabled = true


	


func _on_timer_timeout() -> void:
	queue_free()
