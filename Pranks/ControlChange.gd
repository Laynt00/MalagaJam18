extends Node2D

func prank():
		var player : Player = get_tree().get_first_node_in_group("Player")
		player.reverse_controls()
