@tool
extends Node
class_name VertexPaintTool

var enabled:bool = false:
	set(value):
		enabled = value
		if enabled:
			_on_enable()
		else:
			_on_disable()


func _enter_tree():
	pass

func _on_enable():
	pass

func _on_disable():
	pass
