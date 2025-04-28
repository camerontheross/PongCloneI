extends CharacterBody2D

const SPEED = 400
var win_height
var p_height

func _ready(): 
	win_height=get_viewport_rect().size.y
	p_height=$ColorRect.get_size().y

func _physics_process(delta):
	velocity =Vector2()
	if Input.is_action_pressed("up"):
		velocity.y -=1
	elif Input.is_action_pressed("down"):
		velocity.y +=1
	velocity=velocity.normalized()*SPEED
	move_and_collide(velocity*delta) 
	
	#clamp
	position.y = clamp(position.y, p_height / 2, win_height - p_height / 2)
