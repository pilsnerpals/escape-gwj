extends Control
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_play_pressed():
	#load in first level
	pass # Replace with function body.


func _on_settings_pressed():
	#load settings page
	get_tree().change_scene_to_file("res://Scenes/Menus/Settings.tscn")
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().quit()
	#exit game
	pass # Replace with function body.
