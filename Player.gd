extends KinematicBody2D
export var x_limits = 300
var momentum = Vector2.ZERO
export var x_speed = 50
export var fall_speed = 15
export var terminal_velocity = 500
var is_ljing = false
var queue_timer = 0
var timer = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if position.y > 1024:
		get_tree().reload_current_scene()
	var t_x_limits = 500 if is_ljing else 300
	momentum.x = clamp(momentum.x, -t_x_limits, t_x_limits)
	print(momentum.x)
	if Input.is_action_pressed("l"):
		$Sprite.scale.x = -1
		momentum.x -= 50
	elif Input.is_action_pressed("r"):
		$Sprite.scale.x = 1 
		momentum.x+=x_speed
	else:
		momentum.x = lerp(momentum.x, 0, 0.2)
	if is_on_floor():
		is_ljing = false
		if timer > 60:
			$Camera2D.shaking = 10
		timer = 0
	else:
		timer+=1
		momentum.y += fall_speed
		if momentum.y > terminal_velocity:
			momentum.y = terminal_velocity
		if queue_timer > 0:
			queue_timer -= 1
		if Input.is_action_pressed("j"):
			queue_timer += 10
		if Input.is_action_pressed("lj") and is_ljing == false:
			if abs(momentum.x) >= 5:
				momentum.y -= 30
				momentum.x = 200 if momentum.x > 0 else -200
				is_ljing = true
	if timer < 5:
		if Input.is_action_pressed("j") or queue_timer > 0:
			queue_timer = 0
			momentum.y -= 110
		if Input.is_action_pressed("lj"):
			queue_timer = 0
			if abs(momentum.x) >= 5:
				momentum.y -= 85
				momentum.x = 500 if momentum.x > 0 else -500
				is_ljing = true
	move_and_slide(momentum, Vector2.UP)

	
