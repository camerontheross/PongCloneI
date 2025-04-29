extends CharacterBody2D

var direction: int
var random: int

func _ready():
	randomize()
	random = randi() % 2
	


func _physics_process(delta):
	print(random)
	
	if random == 1:
		velocity.x += 1
	else:
		velocity.x += -1
		
	move_and_slide()
