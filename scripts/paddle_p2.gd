extends CharacterBody2D


const SPEED: float = 500
@onready var p_body: ColorRect = $ColorRect
@onready var win_height: float = get_viewport_rect().size.y
@onready var p_height: float = $ColorRect.get_size().y



func _ready(): 
	
	pass

func _physics_process(delta):
	velocity = Vector2()
	
	if Input.is_action_pressed("up_P2"):
		velocity.y -=1
	elif Input.is_action_pressed("down_P2"):
		velocity.y +=1
	
	#normalize velocity
	# normalize is some math bs to us now 
	# but just know it's important to fixing movement script math 
	velocity = velocity.normalized() * SPEED 
	move_and_collide(velocity*delta) 
	
	#clamp sets a min and a max for variables
	#in this example we set a min and a max to the players Y position
	position.y = clamp(position.y, p_height / 2, win_height - p_height / 2)
