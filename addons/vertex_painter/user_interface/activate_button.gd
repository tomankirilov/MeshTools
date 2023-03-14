@tool
extends Button


var events:VpainterEvents

func _enter_tree():
	events = load("res://addons/vertex_painter/systems/vpainter_events.res")
	button_down.connect(on_button_down)


func on_button_down():
	events.is_active = !events.is_active
