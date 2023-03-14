#RAYCAST FROM CAMERA:
@tool
extends Resource
class_name PluginCameraRaycast

@export var collision_mask:int = 524288

var hit_position:Vector3
var hit_normal:Vector3
signal hit(hit_position:Vector3, hit_normal:Vector3)
var is_hit:bool = false:
	set(value):
		is_hit = value
		if value:
			emit_signal("hit", hit_position, hit_normal)


var input_events:PluginInputEvents

func _start():
	input_events = load("res://addons/vertex_painter/systems/plugin_input_events.res")

func _cast(camera:Node, event:InputEvent, direct_space_state) -> void:
	var ray_origin = camera.project_ray_origin(input_events.mouse_screen_position)
	var ray_dir = camera.project_ray_normal(input_events.mouse_screen_position)
	var ray_distance = camera.far

	var p = PhysicsRayQueryParameters3D.new()
	p.from = ray_origin
	p.to = ray_origin + ray_dir * ray_distance
	p.set_collision_mask(collision_mask)

	var _hit = direct_space_state.intersect_ray(p)
	#IF RAYCAST HITS A DRAWABLE SURFACE:
	if _hit.size() == 0:
		is_hit = false
		return
	if _hit:
		is_hit = true
		hit_position = _hit.position
		hit_normal = _hit.normal
