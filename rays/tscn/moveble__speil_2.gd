extends CharacterBody2D

var move_distance := 32  # tile size
var push_direction := Vector2(1, 0)  # default direction to move



func push(direction: Vector2):
	var target_position = position + direction * move_distance
	# Create query to check collisions
	var query = PhysicsPointQueryParameters2D.new()
	query.position = target_position
	query.collide_with_bodies = true
	query.exclude = [self]

	var space_state = get_world_2d().direct_space_state
	var result = space_state.intersect_point(query)

	if result.empty():
		position = target_position
