extends Node2D

@onready var player = $"../Player"
@onready var hud = $HUD
@onready var hearts_container = $HeartsContainer


func _on_area_2d_body_entered(body):
		player.currentHealth -= 1
		var panel_to_remove = hearts_container.get_child(player.currentHealth)


	#if player.currentHealth < 0:
		#llamar a la animación de muerte
		
