extends Node2D

@export var duration = 2

func prank():
	print("PranksManager: ReversedScreen")
	var cam : Camera2D = get_tree().get_first_node_in_group("Camera")
	cam.zoom = Vector2(cam.zoom.x * -1, cam.zoom.y * -1)
