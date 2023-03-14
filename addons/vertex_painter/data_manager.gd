#DATA MANAGER:
@tool
extends Node


func _enter_tree():
	_load_data()

func _exit_tree():
	_save_data()

var data:VertexPaintData
var data_path:String = "res://addons/vertex_painter/data/data.res"

func _save_data():
	ResourceSaver.save(data, data_path)

func _load_data():
	if ResourceLoader.exists(data_path):
		data = ResourceLoader.load(data_path)
	else:
		data = VertexPaintData.new()
		_save_data()
