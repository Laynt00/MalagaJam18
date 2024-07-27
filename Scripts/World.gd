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

 	# Reset al HUD
	$HUD.get_node("Start").show()

func _process(delta):
	if game_running:
		speed = START_SPEED
		
		generate_obs()
		
		#player.position.x += speed
		#camera_2d.position.x += speed
		
		# Actualizar Score
		score += speed
		show_score()

		
		# Actualizar posicion del suelo
		if camera_2d.position.x - ground.position.x > screen_size.x * 1.5:
			ground.position.x = screen_size.x
	else:
		if Input.is_action_pressed("ui_accept"):
			game_running = true
			$HUD.get_node("Start").hide()

func generate_obs():
	# Generar objetos de suelo
	if obstacles.is_empty():
		# nos devuelve aleatoriamente uno de los obstáculos del array
		# La explicación está aquí: https://www.youtube.com/watch?v=snjx_wAI8WQ
		var obs_type = obstacle_types[randi() % obstacle_types.size()]
		var obs
		# Una vez instanciado el nodo, podemos coger sus propiedades
		obs = obs_type.instantiate()
		var obs_height = obs.get_node("Sprite2D").texture.get_height()
		var obs_scale = obs.get_node("Sprite2D").scale
		# Pocición en x donde se genera el obstáculo
		var obs_x : int = screen_size.x + score + 100
		# Posición en y donde se genera el obstáculo,
		# (obs_height * obs_scale.y / 2) es lo que mide el sprite y el + 5 es para darle un offset
		var obs_y : int = screen_size.y - ground_height - (obs_height * obs_scale.y / 2) + 5
		last_obs = obs
		add_obs(obs, obs_x, obs_y)
		
func add_obs(obs, x, y):
	obs.position = Vector2i(x, y)
	add_child(obs)
	obstacles.append(obs)
# Muestro el score en el HUD, aplicándo un modificador para que no escale demasiado
func show_score():
	$HUD.get_node("ScoreLabel").text = "SCORE: " + str(score / SCORE_MODIFIER)
