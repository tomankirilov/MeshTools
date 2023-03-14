#BRUSH TOOL:
@tool
extends "res://addons/vertex_painter/vertex_paint_tools/vertex_paint_base_tool.gd"

var process_brush:bool = false

var vpainter_data:VpainterData
var input_events:PluginInputEvents

func _enter_tree():
	super()
	vpainter_data   = load("res://addons/vertex_painter/data/vpainter_data.res")
	input_events = load("res://addons/vertex_painter/systems/plugin_input_events.res")
	name = "brush"

func _on_enable():
	super()
	input_events.lmb_down.connect(_on_lmb_down)
	input_events.lmb_up.connect(_on_lmb_up)

func _on_disable():
	super()
	if input_events.lmb_down.is_connected(_on_lmb_down):
		input_events.lmb_down.disconnect(_on_lmb_down)
	if input_events.lmb_up.is_connected(_on_lmb_up):
		input_events.lmb_up.disconnect(_on_lmb_up)

func _on_lmb_down():
	process_brush = true
	_process_brush()
	pass

func _on_lmb_up():
	process_brush = false

func _process_brush():
	while process_brush:
		if input_events.is_ctrl_down:
			print("erasing")
		else:
			print("painting")
		await get_tree().create_timer(vpainter_data.brush_spacing).timeout
