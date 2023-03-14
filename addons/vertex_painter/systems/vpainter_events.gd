@tool
extends Resource
class_name VpainterEvents


signal is_activated(value:bool)
var is_active:bool = false:
	set(value):
		is_active = value
		emit_signal("is_activated", value)
