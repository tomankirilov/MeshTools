@tool
extends Resource
class_name VpainterEvents


signal is_activated(value:bool)
var is_active:bool = false:
	set(value):
		is_active = value
		emit_signal("is_activated", value)

signal mouse_moved(value:Vector3)
var mouse_position:Vector3:
	set(value):
		if value == mouse_position:
			return
		mouse_position = value
		emit_signal("mouse_moved", value)



signal lmb_down
signal lmb_up
var is_lmb_down:bool = false:
	set(value):
		if value == is_lmb_down:
			return
		is_lmb_down = value
		if value:
			emit_signal("lmb_down")
		else:
			emit_signal("lmb_up")

signal ctrl_down
signal ctrl_up
var is_ctrl_down:bool = false:
	set(value):
		if value == is_ctrl_down:
			return
		is_ctrl_down = value
		if value:
			emit_signal("ctrl_down")
		else:
			emit_signal("ctrl_up")

signal shift_down
signal shift_up
var is_shift_down:bool = false:
	set(value):
		if value == is_shift_down:
			return
		is_shift_down = value
		if value:
			emit_signal("shift_down")
		else:
			emit_signal("shift_up")


