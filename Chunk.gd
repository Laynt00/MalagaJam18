extends TileMap

class_name  Chunk

@export var speed = 50.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.x -= speed
