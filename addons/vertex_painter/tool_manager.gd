#TOOL MANAGER:
@tool
extends Node

var data:VertexPaintData
var events:Events

var brush
var eraser
var fill

var tools:Array[VertexPaintTool]
var active_tool:int

func _enter_tree():
	data = load("res://addons/vertex_painter/data/data.res")
	data.active_tool_changed.connect(on_tool_changed)

	events = load("res://addons/vertex_painter/data/events.res")
	events.is_activated.connect(on_plugin_activated)

	tools.append(load("res://addons/vertex_painter/tools/brush.gd").new())
	tools.append(load("res://addons/vertex_painter/tools/eraser.gd").new())
	tools.append(load("res://addons/vertex_painter/tools/fill.gd").new())

	active_tool = clamp(data.active_tool, 0, tools.size() - 1)

	for tool_ref in tools:
		add_child(tool_ref)

func on_plugin_activated(value):
	if value:
		tools[active_tool].enabled = true



func on_tool_changed(value:int):
	if value == active_tool:
		return

	tools[active_tool].enabled = false
	active_tool = clamp(value, 0, tools.size() - 1)
	tools[active_tool].enabled = true

func _exit_tree():
	for child in get_children():
		child.free()