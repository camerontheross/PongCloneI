extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible= false

func _input(event: InputEvent):
	if event.is_action_pressed("reveal him") and visible== false:
		visible= true
	elif event.is_action_pressed("reveal him"): visible= false
