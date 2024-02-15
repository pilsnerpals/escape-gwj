extends Node2D

var coworker = preload("res://Scenes/Enemies/coworker.tscn")
var enemies: Array = []
# Called when the node enters the scene tree for the first time.
func _ready():
	var x = 576
	var y = 324
	var cw = coworker.instantiate()
	cw.init(Vector2(x,y))
	add_child(cw)
	enemies.append(cw)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
