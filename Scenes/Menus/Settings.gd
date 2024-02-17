extends Control

class BindingInfo:
	var button: Button
	var action: String
	func _init(_button: Button, _action: String):
		button = _button
		action = _action

@onready var rightBinding: Button = $"Actions/GridContainer/Move Right Binding"
@onready var leftBinding: Button = $"Actions/GridContainer/Move Left Binding"
@onready var jumpBinding: Button = $"Actions/GridContainer/Jump Binding"
@onready var popup: Popup = $"Popup"

var keybindings: Array[BindingInfo] = []
var listening: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	keybindings.append(BindingInfo.new(rightBinding, "move_right"))
	keybindings.append(	BindingInfo.new(leftBinding, "move_left"))
	keybindings.append(BindingInfo.new(jumpBinding, "move_jump"))
	
	var bindings: Array = InputMap.get_actions();
	for binding in keybindings:
		var events: Array[InputEvent] = InputMap.action_get_events(binding.action)
		var action_text = events[0].as_text();
		var action_name = action_text.split(" ")[0]
		binding.button.text = action_name

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menus/MainMenu.tscn")
	pass # Replace with function body.

func _unhandled_key_input(event):
	if listening:
		if event is InputEventKey:
			print(event)
			listening = false
			popup.visible = false

func _handleButtonPress(name: String):
	popup.visible = true
	listening = true
	pass

func _on_move_right_binding_pressed():
	_handleButtonPress("test")
	pass # Replace with function body.


func _on_move_left_binding_pressed():
	_handleButtonPress("test")
	pass # Replace with function body.


func _on_jump_binding_pressed():
	_handleButtonPress("test")
	pass # Replace with function body.
