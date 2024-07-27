extends Node2D

@export var zoom_new = 2
@export var zoom_duration = 2

func prank():
	print("PranksManager: ZoomIn")
	var cam : Camera2D = get_tree().get_first_node_in_group("Camera")
	var tween : Tween = create_tween()
	tween.tween_property(cam, "zoom", zoom_new, zoom_duration)
	cam.zoom = Vector2(zoom_new, zoom_new)
