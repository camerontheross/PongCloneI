extends CharacterBody2D

const MAX_SPEED: int = 750
const SERVE_SPEED: int = 400
var speed: int = 0
var center
var direction: int
@export var acceleration = 50
signal reset()

func _ready():
	
	#this lines pretty neat - basically the ball calculates the 
	#center of the screen using the viewport
	center = get_viewport().get_visible_rect().size / 2
	position = center
	speed = SERVE_SPEED
	
	#randomize sets a new seed based on the time
	randomize()
	#randonmy picks from the array
	#this lets us make sure it only picks from -1 and 1
	direction = [-1, 1].pick_random()

#resets position and reverses direction 
func serve():
	position = center
	direction *= -1
	speed = SERVE_SPEED

func _physics_process(delta):
	
	if Input.is_action_just_released("reveal him"):
		serve()
	
	velocity.x = direction
	velocity = velocity.normalized() * speed
	move_and_collide(velocity * delta) 

func bounce(body: Node2D) -> void:
	#print ("cameron isn't that bad actually")
	direction *= -1
	if speed < MAX_SPEED:
		speed += acceleration
	print (speed)



func _on_reset() -> void:
	serve()
