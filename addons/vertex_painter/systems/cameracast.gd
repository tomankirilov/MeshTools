#RAYCAST FROM CAMERA:
@tool
extends EditorPlugin

var plugin:EditorPlugin
var input_manager
var events:VpainterEvents

var is_hit:bool = false
var hit_position:Vector3
var hit_normal:Vector3



func _enter_tree():
	plugin = get_parent()
	input_manager = plugin.input_manager
	events = load("res://addons/vertex_painter/systems/vpainter_events.res")

func _cast(camera:Node, event:InputEvent, direct_space_state) -> void:
	var ray_origin = camera.project_ray_origin(input_manager.mouse_pos)
	var ray_dir = camera.project_ray_normal(input_manager.mouse_pos)
	var ray_distance = camera.far

	var p = PhysicsRayQueryParameters3D.new()
	p.from = ray_origin
	p.to = ray_origin + ray_dir * ray_distance
	p.set_collision_mask(524288)

	var _hit = direct_space_state.intersect_ray(p)
	#IF RAYCAST HITS A DRAWABLE SURFACE:
	if _hit.size() == 0:
		is_hit = false
		return
	if _hit:
		is_hit = true
		hit_position = _hit.position
		hit_normal = _hit.normal
		
		events.mouse_position = hit_position
