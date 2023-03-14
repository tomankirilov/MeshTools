@tool
extends MeshInstance3D


var data:VpainterData
var events:VpainterEvents


func _enter_tree() -> void:
	hide()
	data = load("res://addons/vertex_painter/data/vpainter_data.res")
	data.brush_size_changed.connect(on_brush_size_changed)
	data.brush_opacity_changed.connect(on_brush_opacity_changed)
	
	events = load("res://addons/vertex_painter/systems/vpainter_events.res")
	events.is_activated.connect(on_activated)
	events.mouse_moved.connect(on_mouse_moved)

func on_mouse_moved(value:Vector3) -> void:
	position = events.mouse_position


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

