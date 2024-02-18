extends Area2D

signal player_exited

@export var level: int

func _on_body_entered(body):
	player_exited.emit(level)
	pass # Replace with function body.
