extends Node2D

@export var speed = 10
@export var spawn_place : Node2D
@export var chunks : Array[PackedScene]
var chunks_spawn = []

##Copia y baraja la lista de chunks, saco la de delante y spawnea
##Si ya no quedan se copia de nuevo
#Entonc
func _on_timer_timeout():
	spawn_chunk()

func spawn_chunk():
	if chunks_spawn.size() == 0:
		print("rellenar chunks_spawn")
		chunks_spawn.append_array(chunks)
		chunks_spawn.shuffle()
	var chunk : PackedScene = chunks_spawn.pop_front()
	var instance = chunk.instantiate()
	instance.global_position = spawn_place.global_position
	instance.speed = speed
	get_parent().add_child(instance)
	print("spawnea chunk: ", chunks_spawn.size())
