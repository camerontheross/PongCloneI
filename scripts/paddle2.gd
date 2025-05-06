extends CharacterBody2D


#same as P1 scripts but with p2 controls

const SPEED: float = 550
var y_bounce_dir = 0
@onready var p_body: ColorRect = $ColorRect
#game window height
@onready var win_height: float = get_viewport_rect().size.y
#game player height
@onready var p_height: float = $ColorRect.get_size().y




func _ready(): 

	pass

func _physics_process(delta):
	
	velocity = Vector2()
	
	if Input.is_action_pressed("up_P2"):
		#handles UP 
		velocity.y -= 1
	elif Input.is_action_pressed("down_P2"):
		#handles DOWN
		velocity.y += 1
	
	velocity *= SPEED 
	move_and_slide()
	position.y = clamp(position.y, p_height / 2, win_height - p_height / 2)



func _on_middle_body_entered(body):
	y_bounce_dir = 0 + (velocity.normalized().y * .1)
	body.emit_signal("y_bounce", y_bounce_dir)

func _on_top_body_entered(body):
	y_bounce_dir = (-1 * .3) + (velocity.normalized().y * .5)
	body.emit_signal("y_bounce", y_bounce_dir)

func _on_bottom_body_entered(body):
	y_bounce_dir = (1 * .3) + (velocity.normalized().y * .5)
	body.emit_signal("y_bounce", y_bounce_dir)
