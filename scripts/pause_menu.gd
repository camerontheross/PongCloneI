extends Control


@onready var title = $Title
@onready var timer = $Timer

func _ready():
	#the timer is to get the blinking pause text
	timer.start()
	visible = false
	get_tree().paused = false

#pause and resume functions
#placed in functions so we can add things to them later if we want
func pause():
	get_tree().paused = true
	visible = true

func resume():
	get_tree().paused = false
	visible = false


func _input(event):
	#if esc key pressed and game isn't paused
	if event.is_action_pressed("pause") and get_tree().paused == false:
		pause()
	#if esc key pressed and game IS paused
	elif event.is_action_pressed("pause") and get_tree().paused == true:
		resume()

#blinking title function
func _on_timer_timeout():
	if title.visible == true:
		title.hide()
	else:
		title.show()
	timer.start()

#button functions
func _on_restart_pressed():
	get_tree().reload_current_scene()
func _on_options_pressed():
	pass
func _on_exit_pressed():
	resume()
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
