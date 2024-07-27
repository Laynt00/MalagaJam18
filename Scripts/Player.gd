extends CharacterBody2D
class_name Player

const SPEED = 300.0
@export var jump_velocity = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var maxHealth = 3
@onready var currentHealth: int = maxHealth

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		# Meter animación caida
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		# Meter animacion salto
		velocity.y = jump_velocity

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
