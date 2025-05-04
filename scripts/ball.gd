extends CharacterBody2D

const MAX_SPEED: float = 750
const SERVE_SPEED: float = 420
var speed: float = 0
@onready var bump: AudioStreamPlayer2D = $bump
@onready var serve_sound: AudioStreamPlayer = $serve_sound



@export var acceleration = 50
signal y_bounce(y_new_dir: int)
signal reset()

func _ready():
	randomize()
	
	#this lines pretty neat - basically the ball calculates the 
	#center of the screen using the viewport
	position = get_viewport().get_visible_rect().size / 2
	speed = SERVE_SPEED
	acceleration = 50
	
	#randonmy picks from the array
	#this lets us make sure it only picks from -1 and 1
	velocity.x = [-1, 1].pick_random()
	velocity.y = 0

#resets position and reverses direction 

func _physics_process(delta):
	if Input.is_action_just_released("reveal him"):
		serve()
	
	var collision = move_and_collide(velocity * speed * delta)
	if collision:
		bump.play()
		accelerate()
		velocity = velocity.bounce(collision.get_normal())

func accelerate():
	if speed < MAX_SPEED:
		speed += acceleration
		#speed *= 1.5
		acceleration *= 1.5

func serve():
	_ready()
	#I put the sound in this function instead of the ready function because I don't want this sound to play
	#at the end of the game start countdown. Placed here it will only start playing after the first score.
	#P.S. this sound is better as a serve sound as opposed to a score sound, thus why I've placed it here.
	serve_sound.play()

func _on_reset() -> void:
	serve()

func _on_y_bounce(y_new_dir):
	velocity.y = y_new_dir
