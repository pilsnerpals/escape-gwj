extends Area2D
signal player_hit
@onready var taunts = [$bosstaunt1, $bosstaunt2]
@onready var taunt_index = 0

var velocity: Vector2 = Vector2(40.0,0)

func _increase_speed():
	velocity.x += 50

func _physics_process(delta):
	position += velocity * delta


func _on_body_entered(body):
	player_hit.emit()
	pass # Replace with function body.

func _on_coffee_collected():
	velocity.x += 50

func _on_taunt_timer_timeout():
	taunts[taunt_index].play()
	if taunt_index == taunts.size() -1:
		taunt_index = 0
	else:
		taunt_index += 1
