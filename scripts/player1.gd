extends CharacterBody2D


# LOOK HERE GAVIN V=(° °)=V  <--- crab btw
# ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
# ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
# Im gonna fill this bitch up with comments so read them
# Hopefully I can help transplant my years of college coding
# through comments and save you crippling debt to learn coding
# also I'm cleaning up some of the messy code
# if you find time you should watch some vids to help 
# learn good coding etiquite / practices (otherwise I might have a stroke )


#I'm leaving old code in here as comments 
#just so we can look back on this project

#to start I switched us to these onready variables

#they basically do a similar thing to a ready function
#start using @onready instead for variables 
#the ready function should just be used for when we actually run code

#Global variables and constants defined at top
#defining variable type at beginning helps save us some time
#good practice for when we optimize later games
const SPEED: float = 550
var y_bounce_dir = 0
@onready var p_body: ColorRect = $ColorRect
#game window height
@onready var win_height: float = get_viewport_rect().size.y
#game player height
@onready var p_height: float = $ColorRect.get_size().y



#made this useless for now (Monday April 28)
#keeping it just for reference and in case we need later
func _ready(): 
	
	#win_height = get_viewport_rect().size.y
	#p_height = $ColorRect.get_size().y
	
	#pass just makes the code do nothing when it runs.
	#Im pretty sure it throws an error in GD-Script if the func
	#is empty and we try to run without pass
	pass

func _physics_process(delta):
	#set the velocity variable to a Vector2 (vector math for movement)
	velocity = Vector2()
	#checks for player input
	if Input.is_action_pressed("up"):
		#handles UP 
		velocity.y -= 1
	elif Input.is_action_pressed("down"):
		#handles DOWN
		velocity.y += 1
	
	# normalize velocity
	# normalize is some math bs to us now 
	# but just know it's important to fixing movement script math 
	velocity = velocity.normalized() * SPEED 
	move_and_collide(velocity * delta) 
	#clamp sets a min and a max for variables
	#in this example we set a min and a max to the players Y position
	position.y = clamp(position.y, p_height / 2, win_height - p_height / 2)



func _on_middle_body_entered(body):
	y_bounce_dir = 0 + (velocity.normalized().y * .1)
	body.emit_signal("y_bounce", y_bounce_dir)
	print("mid")
func _on_top_body_entered(body):
	y_bounce_dir = (-1 * .3) + (velocity.normalized().y * .5)
	body.emit_signal("y_bounce", y_bounce_dir)
	print("top")

func _on_bottom_body_entered(body):
	y_bounce_dir = (1 * .3) + (velocity.normalized().y * .5)
	body.emit_signal("y_bounce", y_bounce_dir)
	print("bot")
