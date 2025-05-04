extends Control


@onready var title = $Title
@onready var timer = $Timer
signal back

func _ready():
	#the timer is to get the blinking pause text
	timer.start()
	#this is just some background stuff
	#if the options are opened thru pause i wanted the background 
	#to be a bit transparent
	if get_parent().name == "UserInterface":
		$background.color = "0000009b"
		visible = false
	#when we go thru the menu the background is solid
	else:
		$background.color = "000000"
		visible = true


func _input(event):
	if event.is_action_pressed("pause"):
		visible = false
		emit_signal("back")

#blinking title function
func _on_timer_timeout():
	if title.visible == true:
		title.hide()
	else:
		title.show()
	timer.start()

#button functions
func _on_pause_menu_options():
	visible = true

#button that returns to last screen
func _on_back_pressed():
	visible = false
	#if the pause menu is up we use back to return to the pause menu
	if get_parent().name == "UserInterface":
		emit_signal("back")
	#if options were opened through the main menu we go back to the menu
	else:
		get_tree().change_scene_to_file("res://scenes/menu/menu.tscn")
