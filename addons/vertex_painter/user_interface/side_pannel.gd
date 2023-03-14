@tool
extends Control

var plugin:EditorPlugin
var data:VpainterData
var events:VpainterEvents

var btn_paint_color:ColorPickerButton
var btn_erase_color:ColorPickerButton

var ui_edit_r
var ui_edit_g
var ui_edit_b
var ui_edit_a

var ui_brush_size    :HSlider
var ui_brush_opacity :HSlider
var ui_brush_falloff :HSlider
var ui_brush_spacing :HSlider



func on_plugin_activated(value):
	if value:
		show()
	else:
		hide()

func _enter_tree():
	hide()
	data = load("res://addons/vertex_painter/data/vpainter_data.res")
	
	events = load("res://addons/vertex_painter/systems/vpainter_events.res")
	events.is_activated.connect(on_plugin_activated)

	data = load("res://addons/vertex_painter/data/vpainter_data.res")
	btn_paint_color = $MarginContainer/VBoxContainer/Colors/GridContainer/PaintColor
	btn_paint_color.color = data.paint_color
	btn_paint_color.color_changed.connect(on_paint_color_changed)
	data.paint_color_changed.connect(on_data_paint_color_changed)

	btn_erase_color = $MarginContainer/VBoxContainer/Colors/GridContainer/EraseColor
	btn_erase_color.color = data.erase_color
	btn_erase_color.color_changed.connect(on_erase_color_changed)
	data.erase_color_changed.connect(on_data_erase_color_changed)

	ui_brush_size       = $MarginContainer/VBoxContainer/GridContainer/Size
	ui_brush_size.value = data.brush_size
	ui_brush_size.value_changed.connect(on_brush_size_changed)
	
	ui_brush_opacity = $MarginContainer/VBoxContainer/GridContainer/Opacity
	ui_brush_opacity.value = data.brush_opacity
	ui_brush_opacity.value_changed.connect(on_brush_opacity_changed)

	ui_brush_falloff = $MarginContainer/VBoxContainer/GridContainer/Hardness
	ui_brush_falloff.value = data.brush_falloff
	ui_brush_falloff.value_changed.connect(on_brush_falloff_changed)

	ui_brush_spacing = $MarginContainer/VBoxContainer/GridContainer/Spacing
	ui_brush_spacing.value = data.brush_spacing
	ui_brush_spacing.value_changed.connect(on_brush_spacing_changed)

	ui_edit_r = $MarginContainer/VBoxContainer/EditableChannels/R
	ui_edit_g = $MarginContainer/VBoxContainer/EditableChannels/G
	ui_edit_b = $MarginContainer/VBoxContainer/EditableChannels/B
	ui_edit_a = $MarginContainer/VBoxContainer/EditableChannels/A

func on_brush_size_changed(value:float) -> void:
	if value == data.brush_size:
		return
	data.brush_size = value
func on_data_brush_size_changed(value:float) -> void:
	if value == ui_brush_size.value:
		return
	ui_brush_size.value = value


func on_brush_spacing_changed(value:float) -> void:
	if value == data.brush_spacing:
		return
	data.brush_spacing = value
func on_data_brush_spacing_changed(value:float) -> void:
	if value == ui_brush_spacing.value:
		return
	ui_brush_spacing.value = value

func on_brush_opacity_changed(value:float) -> void:
	if value == data.brush_opacity:
		return
	data.brush_opacity = value
func on_data_brush_opacity_changed(value:float) -> void:
	if value == ui_brush_opacity.value:
		return
	ui_brush_opacity.value = value

func on_brush_falloff_changed(value:float) -> void:
	if value == data.brush_falloff:
		return
	data.brush_falloff = value
func on_data_brush_falloff_changed(value:float) -> void:
	if value == ui_brush_falloff.value:
		return
	ui_brush_falloff.value = value




func on_paint_color_changed(value:Color):
	if value == data.paint_color:
		return
	data.paint_color = value
func on_data_paint_color_changed(value:Color):
	if value == btn_paint_color.color:
		return
	btn_paint_color.color = value

func on_erase_color_changed(value:Color):
	if value == data.erase_color:
		return
	data.erase_color = value
func on_data_erase_color_changed(value:Color):
	if value == btn_erase_color.color:
		return
	btn_erase_color.color = value
