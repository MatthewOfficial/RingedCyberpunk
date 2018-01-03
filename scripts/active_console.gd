
extends Node2D

export(PackedScene) var object_scene
export var cooldown = 5.0
var time_left
var area
signal console_active

func _ready():
	area = get_node("Area2D")
	
	set_process_input(true)
	set_fixed_process(true)

func _input(event):
	if event.type == InputEvent.KEY && event.pressed:
		var unicode = event.unicode
		var bodies = area.get_overlapping_bodies()
		if(unicode == 101 && bodies.size() != 0):
		
			emit_signal("console_active")
			print("console active")
			set_process_input(false)
		




func _on_Timer_timeout():
	print("timer done")