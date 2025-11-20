extends StaticBody2D

@onready var sprite2d: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var activate_radius: Area2D = $Activate_Radius

func _input(event: InputEvent) -> void: 
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area.connect("body_entered", self, "_on_body_entered")
	area.connect("body_exited", self, "_on_body_exited")
	set_process_input(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_activate_radius_body_entered(body: Node2D) -> void:
	if body.name == Player:


func _on_activate_radius_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
