extends KinematicBody2D

export (float) var speed
export (float) var sensitivity

onready var velocity = Vector2(0, speed)

func _ready():
	return
	
func getSpeedFromPoint(point):
	var dirVector = point - position
	return (dirVector.length() * sensitivity) / dirVector.dot(
	dirVector)

func _process(delta):
	if ($LeftRay.is_colliding()):
		rotate(getSpeedFromPoint($LeftRay.get_collision_point()) + 
		PI/200)
	if ($RightRay.is_colliding()):
		rotate(-getSpeedFromPoint($RightRay.get_collision_point()))
	
	move_and_slide(-velocity.rotated(rotation))
	
	return
