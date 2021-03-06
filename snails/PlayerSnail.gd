extends KinematicBody2D

export (float) var max_speed
export (float) var rotation_speed
var velocity = Vector2()
var drift = true

func _physics_process(delta):
	control(delta)
	move_and_slide(velocity)  

func control(delta):
	var rot_dir = 0
	if Input.is_action_pressed('turn_right'):
		rot_dir += 1
	if Input.is_action_pressed('turn_left'):
		rot_dir -= 1
	rotation = rotation + rotation_speed * rot_dir * delta
	if drift == false:
		velocity = 0
	if Input.is_action_pressed('forward'):
		velocity = Vector2(max_speed, 2).rotated(rotation)
	if Input.is_action_pressed('back'):
		velocity = Vector2(-max_speed/2, 2).rotated(rotation)
	if Input.is_action_pressed('boost'):
		max_speed = 400
		velocity != Vector2()
	else:
		max_speed = 250

func _ready():
	pass
