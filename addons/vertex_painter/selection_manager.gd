#SELECTION MANAGER: (Follows selected nodes)
@tool
extends EditorPlugin


var is_selection_editable:bool = false
var events:Events

func _enter_tree():
	get_editor_interface().get_selection().selection_changed.connect(_on_selection_changed)
	events = load("res://addons/vertex_painter/data/events.res")

func _on_selection_changed():
	var selection :Array = get_editor_interface().get_selection().get_selected_nodes()

	if selection.size() == 0:
		return

	for node in selection:
		if node is MeshInstance3D:
			is_selection_editable = true
		else:
			is_selection_editable = false
			events.is_active = false
			break
