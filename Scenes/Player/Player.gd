extends CharacterBody2D


@export var speed_increase = 60.0
@export var base_speed = 300.0
@export var max_speed = 300.0
@export var jump_velocity = -200.0
@export var jump_height = -500.0
@export var accel = 200
@export var friction = 30

@onready var playerSprite = $AnimatedSprite2D
@onready var speedDebug = $"SpeedDebug"
@onready var velDebug = $"VelocityDebug"
@onready var coffees = [$coffee1, $coffee2, $coffee3]
@onready var jcd_timer = $jumpsoundCD
@onready var coffee_index = randi_range(0,coffees.size()-1)

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	speedDebug.text = "speed: %s" % max_speed
	velDebug.text = "vel: %s" % velocity.x
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("move_jump") and is_on_floor():
		velocity.y = jump_height
		if jcd_timer.is_stopped():
			$jump.play()
			jcd_timer.start()
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


func _on_coffee_collected():
	print("got a coffee speeding up")
	var newCoffeeIndex = randi_range(0,coffees.size()-1)
	while newCoffeeIndex == coffee_index:
		newCoffeeIndex = randi_range(0,coffees.size()-1)
	coffee_index = newCoffeeIndex
	print(coffee_index)
	coffees[coffee_index].play()
	max_speed += speed_increase
	pass # Replace with function body.


func _on_co_worker_player_hit():
	max_speed = base_speed
	$damage.play()
	pass # Replace with function body.

func _on_boss_player_hit():
	get_tree().change_scene_to_file("res://Scenes/Menus/GameOver.tscn")
	pass # Replace with function body.
