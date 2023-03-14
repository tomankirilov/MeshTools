@tool
extends Control

var plugin:EditorPlugin
var vpainter_data:VpainterData
var events:VpainterEvents

var ui_tools:OptionButton

var ui_paint_color:ColorPickerButton
var ui_erase_color:ColorPickerButton

var ui_edit_r:CheckBox
var ui_edit_g:CheckBox
var ui_edit_b:CheckBox
var ui_edit_a:CheckBox

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
	vpainter_data = load("res://addons/vertex_painter/data/vpainter_data.res")
	
	events = load("res://addons/vertex_painter/systems/vpainter_events.res")
	events.is_activated.connect(on_plugin_activated)

	ui_tools = $MarginContainer/VBoxContainer/Tools
	ui_tools.selected = vpainter_data.active_tool
	ui_tools.item_selected.connect(on_active_tool_changed)
	vpainter_data.active_tool_changed.connect(on_data_active_tool_changed)

	ui_paint_color = $MarginContainer/VBoxContainer/Colors/GridContainer/PaintColor
	ui_paint_color.color = vpainter_data.paint_color
	ui_paint_color.color_changed.connect(on_paint_color_changed)
	vpainter_data.paint_color_changed.connect(on_data_paint_color_changed)

	ui_erase_color = $MarginContainer/VBoxContainer/Colors/GridContainer/EraseColor
	ui_erase_color.color = vpainter_data.erase_color
	ui_erase_color.color_changed.connect(on_erase_color_changed)
	vpainter_data.erase_color_changed.connect(on_data_erase_color_changed)

	ui_brush_size       = $MarginContainer/VBoxContainer/GridContainer/Size
	ui_brush_size.value = vpainter_data.brush_size
	ui_brush_size.value_changed.connect(on_brush_size_changed)
	
	ui_brush_opacity = $MarginContainer/VBoxContainer/GridContainer/Opacity
	ui_brush_opacity.value = vpainter_data.brush_opacity
	ui_brush_opacity.value_changed.connect(on_brush_opacity_changed)

	ui_brush_falloff = $MarginContainer/VBoxContainer/GridContainer/Hardness
	ui_brush_falloff.value = vpainter_data.brush_falloff
	ui_brush_falloff.value_changed.connect(on_brush_falloff_changed)

	ui_brush_spacing = $MarginContainer/VBoxContainer/GridContainer/Spacing
	ui_brush_spacing.value = vpainter_data.brush_spacing
	ui_brush_spacing.value_changed.connect(on_brush_spacing_changed)

	ui_edit_r = $MarginContainer/VBoxContainer/EditableChannels/R
	ui_edit_r.button_pressed = vpainter_data.edit_r
	ui_edit_r.toggled.connect(on_edit_r_changed)
	vpainter_data.edit_r_changed.connect(on_data_edit_r_changed)

	ui_edit_g = $MarginContainer/VBoxContainer/EditableChannels/G
	ui_edit_g.button_pressed = vpainter_data.edit_g
	ui_edit_g.toggled.connect(on_edit_g_changed)
	vpainter_data.edit_g_changed.connect(on_data_edit_g_changed)

	ui_edit_b = $MarginContainer/VBoxContainer/EditableChannels/B
	ui_edit_b.button_pressed = vpainter_data.edit_b
	ui_edit_b.toggled.connect(on_edit_b_changed)
	vpainter_data.edit_b_changed.connect(on_data_edit_b_changed)

	ui_edit_a = $MarginContainer/VBoxContainer/EditableChannels/A
	ui_edit_a.button_pressed = vpainter_data.edit_a
	ui_edit_a.toggled.connect(on_edit_a_changed)
	vpainter_data.edit_a_changed.connect(on_data_edit_a_changed)


func on_edit_r_changed(value:bool):
	if value == vpainter_data.edit_r:
		return
	vpainter_data.edit_r = value
func on_data_edit_r_changed(value:bool):
	if value == ui_edit_r.button_pressed:
		return
	ui_edit_r.button_pressed = value

func on_edit_g_changed(value:bool):
	if value == vpainter_data.edit_g:
		return
	vpainter_data.edit_g = value
func on_data_edit_g_changed(value:bool):
	if value == ui_edit_g.button_pressed:
		return
	ui_edit_g.button_pressed = value

func on_edit_b_changed(value:bool):
	if value == vpainter_data.edit_b:
		return
	vpainter_data.edit_b = value
func on_data_edit_b_changed(value:bool):
	if value == ui_edit_b.button_pressed:
		return
	ui_edit_b.button_pressed = value

func on_edit_a_changed(value:bool):
	if value == vpainter_data.edit_a:
		return
	vpainter_data.edit_a = value
func on_data_edit_a_changed(value:bool):
	if value == ui_edit_a.button_pressed:
		return
	ui_edit_a.button_pressed = value


func on_active_tool_changed(value:int):
	if value == vpainter_data.active_tool:
		return
	vpainter_data.active_tool = value
func on_data_active_tool_changed(value:int):
	if value == ui_tools.selected:
		return
	ui_tools.selected = value


func on_brush_size_changed(value:float) -> void:
	if value == vpainter_data.brush_size:
		return
	vpainter_data.brush_size = value
func on_data_brush_size_changed(value:float) -> void:
	if value == ui_brush_size.value:
		return
	ui_brush_size.value = value


func on_brush_spacing_changed(value:float) -> void:
	if value == vpainter_data.brush_spacing:
		return
	vpainter_data.brush_spacing = value
func on_data_brush_spacing_changed(value:float) -> void:
	if value == ui_brush_spacing.value:
		return
	ui_brush_spacing.value = value

func on_brush_opacity_changed(value:float) -> void:
	if value == vpainter_data.brush_opacity:
		return
	vpainter_data.brush_opacity = value
func on_data_brush_opacity_changed(value:float) -> void:
	if value == ui_brush_opacity.value:
		return
	ui_brush_opacity.value = value

func on_brush_falloff_changed(value:float) -> void:
	if value == vpainter_data.brush_falloff:
		return
	vpainter_data.brush_falloff = value
func on_data_brush_falloff_changed(value:float) -> void:
	if value == ui_brush_falloff.value:
		return
	ui_brush_falloff.value = value




func on_paint_color_changed(value:Color):
	if value == vpainter_data.paint_color:
		return
	vpainter_data.paint_color = value
func on_data_paint_color_changed(value:Color):
	if value == ui_paint_color.color:
		return
	ui_paint_color.color = value

func on_erase_color_changed(value:Color):
	if value == vpainter_data.erase_color:
		return
	vpainter_data.erase_color = value
func on_data_erase_color_changed(value:Color):
	if value == ui_erase_color.color:
		return
	ui_erase_color.color = value
