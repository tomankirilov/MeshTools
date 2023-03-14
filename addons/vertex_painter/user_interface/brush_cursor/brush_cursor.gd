@tool
extends MeshInstance3D


var vpainter_data:VpainterData
var events:VpainterEvents
var input_events:PluginInputEvents
var camera_raycast:PluginCameraRaycast


func _enter_tree() -> void:
	hide()
	vpainter_data = load("res://addons/vertex_painter/data/vpainter_data.res")
	vpainter_data.brush_size_changed.connect(on_brush_size_changed)
	vpainter_data.brush_opacity_changed.connect(on_brush_opacity_changed)

	events = load("res://addons/vertex_painter/systems/vpainter_events.res")
	events.is_activated.connect(on_activated)

	input_events = load("res://addons/vertex_painter/systems/plugin_input_events.res")
	input_events.mouse_moved.connect(on_mouse_moved)

	camera_raycast = load("res://addons/vertex_painter/systems/plugin_camera_raycast.res")


func on_mouse_moved() -> void:
	position = camera_raycast.hit_position

	if camera_raycast.is_hit:
		show()
	else:
		hide()


func on_activated(value:bool) -> void:
	if value:
		show()
	else:
		hide()

func on_brush_size_changed(value:float) -> void:
	value = clamp(value, 0, 10)
	scale = Vector3.ONE * value


func on_brush_opacity_changed(value:float) -> void:
	value = clamp(value, 0, 1)
	material_override.set("shader_parameter/max_opacicty", value)

