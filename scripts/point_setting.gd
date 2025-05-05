extends SpinBox

func _ready():
	value = Global.get_points_to_win()


func _on_value_changed(value):
	Global.set_points_to_win(value)
