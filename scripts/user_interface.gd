extends Control

#defining variables and constants at top
#@onready lets us start the game with points set to 0
#typecast to int to save resources
@onready var points_left: int = 0
@onready var points_right: int = 0
#score walls were givin access as unique name property
#this is because we're not gonna have more than one of each 
#gets rid of that gross looking file path text
@onready var goal_left = %score_wall_left
@onready var goal_right = %score_wall_right
#remember that the score increases for opposite side
#when respective goal is touched

#variables storing the score displays on screen
@onready var score_display_left = %score_display_left
@onready var score_display_right = %score_display_right
#reference to the pause menu

func score_check() -> bool:
	if points_left == Global.get_points_to_win():
		print("left wins")
		get_tree().call_deferred("change_scene_to_file", "res://scenes/menu/menu.tscn")
		return false
	
	if points_right == Global.get_points_to_win():
		print("right wins")
		get_tree().call_deferred("change_scene_to_file", "res://scenes/menu/menu.tscn")
		return false
	return true


# when left side scores
func left_add_points():
	points_left += 1
	score_display_left.text = str(points_left)
	

#when right side scores
func right_add_points():
	points_right += 1
	score_display_right.text = str(points_right)
	


func _on_score_wall_left_body_entered(body):
	right_add_points()
	body.emit_signal("reset", score_check())

func _on_score_wall_right_body_entered(body):
	left_add_points()
	body.emit_signal("reset", score_check())
