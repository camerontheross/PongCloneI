extends CharacterBody2D

const SPEED: float = 550
var y_bounce_dir = 0

var ball_pos: Vector2
var ball_vel: Vector2
var target = 324
var error_margin = randf_range(-30.0, 30.0)
var error_margin_set = false
var direction
var dist



@onready var win_height: float = get_viewport_rect().size.y
@onready var win_width: float = get_viewport_rect().size.x
@onready var p_height: float = $ColorRect.get_size().y
@onready var ball = %Ball

func _physics_process(delta):
	velocity = Vector2.ZERO
	ball_pos = ball.position
	ball_vel = ball.velocity
	
	
	if ball_incoming():
		target = get_ball_target()
	elif !ball_incoming():
		target = get_center_target()
	else:
		target = position.y
	
	
	
	dist = target - position.y
	if can_move() and abs(dist) > 25:
		direction = sign(dist)
		velocity.y = direction * SPEED
	else:
		velocity.y = 0
	
	
	
	move_and_slide()
	# Keep paddle within screen bounds
	position.y = clamp(position.y, p_height / 2, win_height - p_height / 2)

func ball_incoming() -> bool:
	if %Ball.velocity.x > 0:
		#error_margin_set = false
		return true
	else: 
		return false
func get_ball_target() -> int:
	if error_margin_set:
		error_margin = randf_range(-30.0, 30.0)
		error_margin_set = false
	
	return round(ball_pos.y + (position.x - ball_pos.x) * (ball_vel.y / ball_vel.x)) + error_margin
func get_center_target() -> int:
	if !error_margin_set:
		error_margin = randf_range(-90.0, 90.0)
		error_margin_set = true
	
	return round(win_height/2) + error_margin
func can_move() -> bool:
	if ball_incoming() and ball_pos.x > abs(win_width / 3) + ball.speed/3:
		return true
	elif !ball_incoming():
		return true
	else:
		return false


#modify y direction based on where the ball hits the paddle
func _on_middle_body_entered(body):
	y_bounce_dir = 0 + (velocity.normalized().y * .1)
	body.emit_signal("y_bounce", y_bounce_dir)
func _on_top_body_entered(body):
	y_bounce_dir = (-1 * .3) + (velocity.normalized().y * .5)
	body.emit_signal("y_bounce", y_bounce_dir)
func _on_bottom_body_entered(body):
	y_bounce_dir = (1 * .3) + (velocity.normalized().y * .5)
	body.emit_signal("y_bounce", y_bounce_dir)
