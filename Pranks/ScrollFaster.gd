extends Node2D

@export var motion_scale_increase = 0.2

func prank():
		var parallax = get_tree().get_first_node_in_group("Parallax")
		#Velocidad de movimiento de los chunks más rápidp
		for pl in parallax.get_children():
			if pl is ParallaxLayer:
				(pl as ParallaxLayer).motion_scale += motion_scale_increase
