extends Timer

func _ready():
	set_fixed_process(true)
	start()

func _on_active_console_console_active():
	start()
	print("timer start")
