extends Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = true

#runs everytime inputs are registered
#func _input(event: InputEvent):
	#
	##checks if the input is "reveal him" and the sprite is not visible
	#if event.is_action_pressed("reveal him") and visible == false:
		#visible = true
	##if he is already visible and the button is pressed again we make him invisible
	#elif event.is_action_pressed("reveal him"):
		#visible = false
