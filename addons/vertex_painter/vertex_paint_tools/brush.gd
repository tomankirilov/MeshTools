#BRUSH TOOL:
@tool
extends "res://addons/vertex_painter/vertex_paint_tools/tool.gd"

var mouse_position:Vector3

var data:VpainterData
var events:VpainterEvents

func _enter_tree():
	super()
	data   = load("res://addons/vertex_painter/data/vpainter_data.res")
	events = load("res://addons/vertex_painter/systems/vpainter_events.res")
	name = "brush"

func _on_enable():
	super()
	print("brush enabled")
	events.lmb_down.connect(on_lmb_down)
	events.lmb_up.connect(on_lmb_up)
	events.mouse_moved.connect(on_mouse_moved)

func _on_disable():
	super()
	events.lmb_down.disconnect(on_lmb_down)
	events.lmb_up.disconnect(on_lmb_up)
	events.mouse_moved.disconnect(on_mouse_moved)

func on_lmb_down():
	if events.is_ctrl_down:
		print("eraser down")
	else:
		print("brush down")

func on_lmb_up():
	print("tool up")

func brush_process():
	pass


func on_mouse_moved(new_mouse_pos:Vector3):
	if new_mouse_pos == mouse_position:
		return
	mouse_position = new_mouse_pos


func _on_tick():
	print(mouse_position)
