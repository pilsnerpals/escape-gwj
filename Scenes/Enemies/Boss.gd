extends RigidBody2D

var SPEED = 40.0

func _increase_speed():
	SPEED += 10

func _physics_process(delta):
	linear_velocity.x =  SPEED
