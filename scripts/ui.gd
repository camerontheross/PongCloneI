extends Node

#defining variables and constants at top
#@onready lets us start the game with points set to 0
#typecast to int to save resources
@onready var score_left: int = 0
@onready var score_right: int = 0
#score walls were givin access as unique name property
#this is because we're not gonna have more than one of each 
#gets rid of that gross looking file path text
@onready var goal_left = %score_wall_left
@onready var goal_right = %score_wall_right
#remember that the score increases for opposite side
#when respective goal is touched

#variables storing the score displays on screen
@onready var score_display_left = $score_display_left
@onready var score_display_right = $score_display_right



# when left side scores
func left_add_point():
	score_left += 1
	score_display_left.text = str(score_left)
#when right side scores
func right_score():
	score_right += 1

func  _input(event):
	if event.is_action_pressed("reveal him"):
		left_add_point()
