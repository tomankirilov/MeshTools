#PLUGIN ENTRY:
@tool
extends EditorPlugin


var input_events:PluginInputEvents
var selection_manager
var camera_raycast:PluginCameraRaycast
var ui_manager
var vpainter_tool_manager
var data_manager

var vpainter_data:VpainterData
var events:VpainterEvents

func _handles(object):
	if selection_manager.is_selection_editable:
		return true
	else:
		return false

func _forward_3d_gui_input(viewport_camera, event):
	if events.is_active:
		camera_raycast._cast(viewport_camera, event, get_viewport().world_3d.direct_space_state)

		return input_events._run(event)
	else:
		return EditorPlugin.AFTER_GUI_INPUT_PASS


func _enter_tree():
	self.name = "plugin"
	vpainter_data = load("res://addons/vertex_painter/data/vpainter_data.res")
	input_events = load("res://addons/vertex_painter/systems/plugin_input_events.res")
	events = load("res://addons/vertex_painter/systems/vpainter_events.res")

	data_manager       = load("res://addons/vertex_painter/data/data_manager.gd").new()
	data_manager.name = "data_manager"
	add_child(data_manager)

	selection_manager  = load("res://addons/vertex_painter/systems/selection_manager.gd").new()
	selection_manager.name = "selection_manager"
	add_child(selection_manager)

	camera_raycast = load("res://addons/vertex_painter/systems/plugin_camera_raycast.res")
	camera_raycast._start()

	vpainter_tool_manager      = load("res://addons/vertex_painter/vertex_paint_tools/vpainter_tool_manager.gd").new()
	vpainter_tool_manager.name = "vpainter_tool_manager"
	add_child(vpainter_tool_manager)

	ui_manager = load("res://addons/vertex_painter/user_interface/ui_manager.gd").new()
	ui_manager.name = "ui_manager"
	add_child(ui_manager)

func _exit_tree():
	pass
