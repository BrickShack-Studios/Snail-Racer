extends Node2D

func _ready():
	set_camera_limits()
	
func set_camera_limits():
	var map_limits = $Floor.get_used_rect()
	var map_cellSize = $Floor.cell_size
	
	$SnailPlayer/Camera2D.limit_bottom = map_limits.end.y * map_cellSize.y 
	$SnailPlayer/Camera2D.limit_top = map_limits.position.y * map_cellSize.y
	$SnailPlayer/Camera2D.limit_right = map_limits.end.x * map_cellSize.x
	$SnailPlayer/Camera2D.limit_left = map_limits.position.x * map_cellSize.x