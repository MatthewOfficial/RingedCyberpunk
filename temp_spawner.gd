
extends Node2D

export(PackedScene) var object_scene
export var cooldown = 5.0
var time_left
var area

func _ready():
	area = get_node("Area2D")
	
	time_left = 5
	
	set_process_input(true)
	set_fixed_process(true)

func _input(event):
	var bodies = area.get_overlapping_bodies()
	if(Input.is_action_pressed("ui_accept") && bodies.size() == 0):
		set_process_input(false)
		emit_signal("console_active")
		print("console active")
		


