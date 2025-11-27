extends StaticBody2D

signal speilHit

func _ready() -> void:
	pass

func _on_area_2d_area_entered(_area: Area2D) -> void:
	emit_signal("speilHit")
