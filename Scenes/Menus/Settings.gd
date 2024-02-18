extends Control

#class BindingInfo:
	#var button: Button
	#var action: String
	#func _init(_button: Button, _action: String):
		#button = _button
		#action = _action

@onready var rightBinding: Button = $"Actions/GridContainer/Move Right Binding"
@onready var leftBinding: Button = $"Actions/GridContainer/Move Left Binding"
@onready var jumpBinding: Button = $"Actions/GridContainer/Jump Binding"
@onready var popup: Popup = $"Popup"

var keybindings: Dictionary = {}
var listening: bool = false
var currentEditing: String = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	keybindings["move_right"] = rightBinding
	keybindings["move_left"] = leftBinding
	keybindings["move_jump"] = jumpBinding
	
	var bindings: Array = InputMap.get_actions();
	popup.window_input
	for event_key in keybindings.keys():
		_setButtonText(event_key)

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menus/MainMenu.tscn")
	pass # Replace with function body.

func _setButtonText(event_key: String):
	var button = keybindings[event_key]
	var events: Array[InputEvent] = InputMap.action_get_events(event_key)
	var action_text = events[0].as_text();
	var action_name = action_text.split(" ")[0]
	button.text = action_name
	
func _on_popup_window_input(event):
	if listening:
		if event is InputEventKey:
			print(event)
			InputMap.action_erase_events(currentEditing)
			InputMap.action_add_event(currentEditing, event)
			_setButtonText(currentEditing)
			
			listening = false
			popup.visible = false
	

func _handleButtonPress(name: String):
	popup.visible = true
	listening = true
	pass

func _on_move_right_binding_pressed():
	_handleButtonPress("test")
	currentEditing = "move_right"
	pass # Replace with function body.


func _on_move_left_binding_pressed():
	_handleButtonPress("test")
	currentEditing = "move_left"
	pass # Replace with function body.


func _on_jump_binding_pressed():
	_handleButtonPress("test")
	currentEditing = "move_jump"
	pass # Replace with function body.



