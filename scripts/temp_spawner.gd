
extends Node2D

export(PackedScene) var object_scene
export var cooldown = 5.0
var time_left
var area
signal start
var started = false

func _ready():
	area = get_node("Area2D")
	
	time_left = 0
	
	set_fixed_process(true)
	

	
func _fixed_process(delta):
	if (started == false):
		yield(self, "start")
	started = true
	time_left -= delta
	if(time_left < 0):
		
		var bodies = area.get_overlapping_bodies()
		if(bodies.size() == 0):
			var node = object_scene.instance()
			
			node.set_pos(get_pos())
			node.set_rot(get_rot())
			get_node("../../").add_child(node)
			
			time_left = cooldown + rand_range(-0.2,0.5)



func _on_Timer_timeout():
	queue_free()



func _on_active_console_console_active():
	emit_signal("start")
