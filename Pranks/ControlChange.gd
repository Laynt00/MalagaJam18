extends Node2D

func prank():
	print("PranksManager: ControlChange")
	var player : Player = get_tree().get_first_node_in_group("Player")
	player.reverse_controls()
