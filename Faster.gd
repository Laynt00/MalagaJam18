extends Node2D

@export var speed_plus = 2

func prank():
	print("PranksManager: Faster TimeScale")
	Engine.time_scale = speed_plus
