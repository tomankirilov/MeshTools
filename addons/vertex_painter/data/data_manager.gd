#DATA MANAGER:
@tool
extends Node


func _enter_tree():
	_load_data()

func _exit_tree():
	_save_data()

var vpainter_data:VpainterData
var vpainter_data_path:String = "res://addons/vertex_painter/data/vpainter_data.res"

func _save_data():
	ResourceSaver.save(vpainter_data, vpainter_data_path)

func _load_data():
	if ResourceLoader.exists(vpainter_data_path):
		vpainter_data = ResourceLoader.load(vpainter_data_path)
	else:
		vpainter_data = VpainterData.new()
		_save_data()
