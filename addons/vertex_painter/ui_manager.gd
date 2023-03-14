#UI MANAGER:
@tool
extends EditorPlugin


var ui_activate_button:Button
var ui_side_pannel:Control
var ui_brush_cursor


func _enter_tree():
	ui_brush_cursor = load("res://addons/vertex_painter/user_interface/brush_cursor/brush_cursor.tscn").instantiate()
	add_child(ui_brush_cursor)

	ui_activate_button = load("res://addons/vertex_painter/user_interface/activate_button.tscn").instantiate()
	add_control_to_container(EditorPlugin.CONTAINER_SPATIAL_EDITOR_MENU, ui_activate_button)

	ui_side_pannel = load("res://addons/vertex_painter/user_interface/side_pannel.tscn").instantiate()
	add_control_to_container(EditorPlugin.CONTAINER_SPATIAL_EDITOR_SIDE_LEFT, ui_side_pannel)



func _exit_tree():
	remove_control_from_container(EditorPlugin.CONTAINER_SPATIAL_EDITOR_MENU, ui_activate_button)
	ui_activate_button.free()
	remove_control_from_container(EditorPlugin.CONTAINER_SPATIAL_EDITOR_SIDE_LEFT, ui_side_pannel)
	ui_side_pannel.free()
