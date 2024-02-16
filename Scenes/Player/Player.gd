extends CharacterBody2D


var max_speed = 300.0
var jump_velocity = -200.0
var jump_height = -400.0
var accel = 200
var friction = 30

@onready var playerSprite = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("move_jump") and is_on_floor():
		velocity.y = jump_height
		playerSprite.animation = "jump"

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		playerSprite.flip_h = direction - 1  # if the sprite defaults facing right, -1. if default is facing left, +1
		if abs(velocity.x) < max_speed: #if not max speed, accelerate
			playerSprite.animation = "walk"
			velocity.x += direction * accel * delta
		else:
			playerSprite.animation = "run"
			velocity.x = direction * max_speed
	else: #slow down because no input
		if velocity.x == 0:
			playerSprite.animation = "idle"
		playerSprite.animation = "walk"
		velocity.x = move_toward(velocity.x, 0, friction)

	move_and_slide()
