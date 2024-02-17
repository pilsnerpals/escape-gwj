extends Control


func _on_play_pressed():
	#load in first level
	get_tree().change_scene_to_file("res://Scenes/game_play.tscn")
	pass # Replace with function body.

func _on_exit_pressed():
	get_tree().quit()
	#exit game
	pass # Replace with function body.
