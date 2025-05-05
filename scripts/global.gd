extends Node

var points_to_win = 10

@onready var sound_bus: AudioBusLayout = preload("res://assets/sounds/sound_buses.tres")

func get_points_to_win() -> int:
	return points_to_win

func set_points_to_win(value):
	points_to_win = value
