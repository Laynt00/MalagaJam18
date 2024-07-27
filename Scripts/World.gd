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
var screen_size : Vector2i
# Usaremos esta variable para colocar justo a esa altura los obstáculos
var ground_height : int
# Controla si el juego se está ejecutando
var game_running : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_window().size
	ground_height = ground.get_node("Sprite2D").texture.get_height()
	new_game()

# Inicializamos las posiciones al empezar el juego
func new_game():
	score = 0
	game_running = false

func _process(delta):

		# Actualizar Score
		score += speed
		show_score()

		
# Muestro el score en el HUD, aplicándo un modificador para que no escale demasiado
func show_score():
	$HUD.get_node("ScoreLabel").text = "SCORE: " + str(score / SCORE_MODIFIER)
