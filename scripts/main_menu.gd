extends Control


func _on_singles_pressed():
	get_tree().change_scene_to_file("res://scenes/singles.tscn")


func _on_doubles_pressed():
	get_tree().change_scene_to_file("res://scenes/doubles.tscn")


func _on_options_pressed():
	pass


func _on_exit_pressed():
	get_tree().quit()
