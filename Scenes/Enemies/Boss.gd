extends Area2D
signal player_hit


var velocity: Vector2 = Vector2(40.0,0)

func _increase_speed():
	velocity.x += 10

func _physics_process(delta):
	position += velocity * delta


func _on_body_entered(body):
	player_hit.emit()
	pass # Replace with function body.
