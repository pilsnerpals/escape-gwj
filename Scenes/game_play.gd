extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().call_group("coworkers", "init")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
