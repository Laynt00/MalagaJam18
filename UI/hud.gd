extends CanvasLayer

@onready var heartClass = preload("res://UI/heart.tscn")


@export var hearts : Array[Control]
@export var health = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

		

func damage():
	health -= 1
	update_health()
	if health <= 0:
		print("Game Over")

func update_health():
	for n in range(hearts.size()):
		if n < health:
			hearts[n].visible = true
		else:
			hearts[n].visible = false
