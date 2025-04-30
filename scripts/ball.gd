extends CharacterBody2D

const SPEED: int = 400
var center
var direction: int

func _ready():
	
	#this lines pretty neat - basically the ball calculates the 
	#center of the screen using the viewport
	center = get_viewport().get_visible_rect().size / 2
	position = center
	
	#randomize sets a new seed based on the time
	randomize()
	#randonmy picks from the array
	#this lets us make sure it only picks from -1 and 1
	direction = [-1, 1].pick_random()

#resets position and reverses direction 
func serve():
	position = center
	direction *= -1


func _physics_process(delta):
	
	if Input.is_action_just_released("reveal him"):
		serve()
	
	velocity.x = direction
	velocity = velocity.normalized() * SPEED 
	move_and_collide(velocity * delta) 
