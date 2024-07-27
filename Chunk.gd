extends TileMap

class_name  Chunk

var speed = 50.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	global_position.x -= speed * delta
	if global_position.x < 0:
		process_mode = Node.PROCESS_MODE_DISABLED
