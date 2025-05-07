extends Control

var time_to_start: int
@onready var count_down_sound: AudioStreamPlayer = $count_down_sound
@onready var timer: Timer = $Countdowntimer
@onready var start_sound = $start_sound

func _ready():
	
	timer.pause_mode = 1
	
	get_parent().get_tree().paused = true
	time_to_start = 3
	_on_countdowntimer_timeout()

func _on_countdowntimer_timeout() -> void:
	if time_to_start == 0:
		start_sound.play()
		get_parent().get_tree().paused = false
		timer.queue_free()
		self.queue_free()
	else:
		count_down_sound.play()
	print(time_to_start)
	time_to_start -= 1
	timer.start()
