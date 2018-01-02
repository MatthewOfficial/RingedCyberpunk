
extends Node2D

export(PackedScene) var object_scene
export var cooldown = 5.0
var time_left
var area

func _ready():
	area = get_node("Area2D")
	
	time_left = 0
	
	set_fixed_process(true)

func _fixed_process(delta):
	time_left -= delta
	
	if(time_left < 0):
		var bodies = area.get_overlapping_bodies()
		if(bodies.size() != 0):
			get_tree().change_scene("res://scenes/end.xml")
			
			