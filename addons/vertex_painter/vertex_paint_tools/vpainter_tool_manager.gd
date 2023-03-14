#TOOL MANAGER:
@tool
extends Node

var vpainter_data:VpainterData
var events:VpainterEvents

var tools:Array[VertexPaintTool]
var active_tool:int

func _enter_tree():
	vpainter_data = load("res://addons/vertex_painter/data/vpainter_data.res")
	vpainter_data.active_tool_changed.connect(on_tool_changed)

	events = load("res://addons/vertex_painter/systems/vpainter_events.res")
	events.is_activated.connect(on_plugin_activated)

	tools.append(load("res://addons/vertex_painter/vertex_paint_tools/brush.gd").new())
	tools.append(load("res://addons/vertex_painter/vertex_paint_tools/fill.gd").new())

	active_tool = clamp(vpainter_data.active_tool, 0, tools.size() - 1)

	for tool_ref in tools:
		add_child(tool_ref)

func on_plugin_activated(value):
	if value:
		tools[active_tool].enabled = true
	else:
		for tool in tools:
			tool.enabled = false

func on_tool_changed(value:int):
	if value == active_tool:
		return
	tools[active_tool].enabled = false
	active_tool = clamp(value, 0, tools.size() - 1)
	tools[active_tool].enabled = true


