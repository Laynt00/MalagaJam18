extends Control

@onready var play = $VBoxContainer/Play
@onready var quit = $VBoxContainer/Quit

# Called when the node enters the scene tree for the first time.
func _ready():
	play.grab_focus()


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/World.tscn")


func _on_quit_pressed():
	get_tree().quit()
