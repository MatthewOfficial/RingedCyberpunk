extends Timer

func _ready():
	pass

func _on_active_console_console_active():
	start()
	print("timer start")
