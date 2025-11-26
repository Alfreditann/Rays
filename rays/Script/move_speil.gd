# attach to the RigidBody2D you want to only move horizontally
extends RigidBody2D

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	# Prevent Y movement
	var lv: Vector2 = state.get_linear_velocity()
	lv.y = 0
	state.set_linear_velocity(lv)

	# Prevent rotation
	state.set_angular_velocity(0)
	rotation = 0
