#BRUSH TOOL:
@tool
extends "res://addons/vertex_painter/vertex_paint_tools/vertex_paint_base_tool.gd"

var mouse_position:Vector3

var vpainter_data:VpainterData
var input_events:PluginInputEvents

func _enter_tree():
	super()
	vpainter_data   = load("res://addons/vertex_painter/data/vpainter_data.res")
	input_events = load("res://addons/vertex_painter/systems/plugin_input_events.res")
	name = "brush"

func _on_enable():
	super()
	print("brush enabled")
#	input_events.lmb_down.connect(on_lmb_down)
#	input_events.lmb_up.connect(on_lmb_up)
	input_events.mouse_moving.connect(on_mouse_moved)

func _on_disable():
	super()
#	input_events.lmb_down.disconnect(on_lmb_down)
#	input_events.lmb_up.disconnect(on_lmb_up)
	input_events.mouse_moving.disconnect(on_mouse_moved)

#func on_lmb_down():
#	if input_events.is_ctrl_down:
#		print("eraser down")
#	else:
#		print("brush down")
#
#func on_lmb_up():
#	print("tool up")


func on_mouse_moved():
	if input_events.is_lmb_down:
		print("LMB Down")

func _on_tick():
	print(mouse_position)
