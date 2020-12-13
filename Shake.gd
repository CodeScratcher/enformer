extends Camera2D
var shake_amount = 1.0
var shaking = 0
func _process(delta):
	if shaking > 0:
		set_offset(Vector2( \
		rand_range(-3.0, 3.0) * shake_amount, \
		rand_range(-3.0, 3.0) * shake_amount \
	))
		shaking -= 1
	else:
		set_offset(Vector2.ZERO)
