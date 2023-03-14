@tool
extends Button


var events:Events

func _enter_tree():
	events = load("res://addons/vertex_painter/data/events.res")
	button_down.connect(on_button_down)


func on_button_down():
	events.is_active = !events.is_active
