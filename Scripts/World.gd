extends Node2D

# Obstaculos a instanciar
var spike = preload("res://Scenes/Spike.tscn")
# Meter los obstáculos a instanciar en el array
var obstacle_types := [spike]
# Guarda los obstáculos que se van generando en pantalla
var obstacles : Array
@onready var hearts_container = $HeartsContainer
@onready var hud = $HUD
@onready var camera_2d = $Camera2D
@onready var player = $Player
@onready var ground = $Ground

const GROUND_POS := Vector2i(288,269)
# Ajustar la camara al nuevo paralax que metamos
const CAMERA_START_POS := Vector2i(295, 136)
const START_SPEED : float = 1.0
const MAX_SPEED : float = 25.0
const SCORE_MODIFIER: int = 10
var score : int

var last_obs
var speed : float


# Called when the node enters the scene tree for the first time.
func _ready():
	score = 0
	game_running = false

func _process(delta):

		# Actualizar Score
		score += speed
		show_score()

		
# Muestro el score en el HUD, aplicándo un modificador para que no escale demasiado

func _process(delta):
	speed = START_SPEED
	score += speed
	show_score()

>>>>>>> 9ee082217b04a99c9811d3ba736631108d74a53c
func show_score():
	$HUD.get_node("ScoreLabel").text = "SCORE: " + str(score / SCORE_MODIFIER)
