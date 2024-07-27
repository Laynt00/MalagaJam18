extends Node2D

func _on_body_entered(body):
	get_tree().get_first_node_in_group("HUD").damage()
