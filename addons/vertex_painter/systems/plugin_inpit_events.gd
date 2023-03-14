@tool
extends Resource
class_name PluginInputEvents

signal mouse_moving
var is_mouse_moving:bool = false
var mouse_screen_position:Vector2
var is_lmb_down:bool = false
var is_shift_down:bool = false
var is_ctrl_down:bool = false
var is_bracketleft_down:bool = false
var is_bracketright_down:bool = false




func _run(event :InputEvent) -> int:
########################################################
#       MOUSE BUTTON        ############################
	if event is InputEventMouse:
		is_mouse_moving = true
		emit_signal("mouse_moving")
		mouse_screen_position = event.position
	else:
		is_mouse_moving = false

	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_pressed():
			is_lmb_down = true
#			events.is_lmb_down = true
			
			return EditorPlugin.AFTER_GUI_INPUT_STOP
		else:
			is_lmb_down = false
#			events.is_lmb_down = false
			return EditorPlugin.AFTER_GUI_INPUT_PASS



########################################################
#       BRACKETS            ############################
	if event is InputEventKey and event.get_keycode() == KEY_BRACKETLEFT:
		if event.is_pressed():
			is_bracketleft_down = true
			print("BRACKETLEFT is DOWN")
			return EditorPlugin.AFTER_GUI_INPUT_STOP
		else:
			is_bracketleft_down = false
			print("BRACKETLEFT is UP")
			return EditorPlugin.AFTER_GUI_INPUT_PASS

	if event is InputEventKey and event.get_keycode() == KEY_BRACKETRIGHT:
		if event.is_pressed():
			is_bracketright_down = true
			print("BRACKETRIGHT is DOWN")
			return EditorPlugin.AFTER_GUI_INPUT_STOP
		else:
			is_bracketright_down = false
			print("BRACKETRIGHT is UP")
			return EditorPlugin.AFTER_GUI_INPUT_PASS

########################################################
#       MODIFIERS           ############################

	if event is InputEventKey and event.get_keycode() == KEY_CTRL:
		if event.is_pressed() and !event.is_echo():
			is_ctrl_down = true
#			events.emit_signal("ctrl_down")
			return EditorPlugin.AFTER_GUI_INPUT_STOP
		elif !event.is_pressed() and !event.is_echo():
			is_ctrl_down = false
#			events.emit_signal("ctrl_up")
			return EditorPlugin.AFTER_GUI_INPUT_PASS
		else:
			return EditorPlugin.AFTER_GUI_INPUT_PASS

	if event is InputEventKey and event.get_keycode() == KEY_SHIFT:
		if event.is_pressed() and !event.is_echo():
			is_shift_down = true
#			events.emit_signal("shift_down")
			return EditorPlugin.AFTER_GUI_INPUT_STOP
		elif !event.is_pressed() and !event.is_echo():
			is_shift_down = false
#			events.emit_signal("shift_up")
			return EditorPlugin.AFTER_GUI_INPUT_PASS
		else:
			return EditorPlugin.AFTER_GUI_INPUT_PASS
########################################################
########################################################
	else:
		return EditorPlugin.AFTER_GUI_INPUT_PASS
