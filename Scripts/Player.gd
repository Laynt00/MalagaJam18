extends CharacterBody2D

class_name Player

const SPEED = 300.0
@export var jump_velocity = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var maxHealth = 7
@onready var currentHealth: int = maxHealth

var is_reversed = false

var direction
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		# Meter animación caida
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		# Meter animacion salto
		velocity.y = jump_velocity
		
	if is_reversed:
		direction = Input.get_axis("left", "right")
	else:
		direction = Input.get_axis("right", "left")
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func reverse_controls():
	is_reversed = true
