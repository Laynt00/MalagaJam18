extends Node2D

@export var motion_scale_increase = 1.0
@export var speed_increase = 20
@onready var chunk_spawner = $"../../ChunkSpawner"

func prank():
	print("PranksManager: ScrollFaster")
	chunk_spawner.speed = speed_increase
	var parallax = get_tree().get_first_node_in_group("Parallax")
	for pl in parallax.get_children():
		if pl is ParallaxLayer:
			(pl as ParallaxLayer).motion_scale = Vector2(motion_scale_increase, motion_scale_increase)
	
