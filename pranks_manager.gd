extends Node2D

@export var pranks : Array[Node2D]

func _ready():
	pranks.shuffle()

func _on_timer_timeout():
	if pranks.size() != 0:
		var p = pranks.pop_front()
		p.prank()
