extends RigidBody2D

export (int, 0, 200) var push = 100

func _physics_process(delta):

	# after calling move_and_slide()

	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("bodies"):
			collision.collider.apply_central_impulse(-collision.normal * push)
