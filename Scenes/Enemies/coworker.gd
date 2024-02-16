extends Area2D

signal player_hit

const MAX_SPEED = 300.0
const MIN_SPEED = 50.0
const WANDER_MAX_DISTANCE = 400
const WANDER_MIN_DISTANCE = 400

var SPEED = 300.0
var spawnPos: Vector2
var direction: int
var wander_target: Vector2
var prevDir: int = 0
var velocity: Vector2

func init():
	spawnPos = position
	wander_target = get_wander_target()
	pass

func get_wander_target() -> Vector2:
	#pick a random distance from spawn and random speed to move(within the limits)
	#will get called initially and whenever the postion is reached or they hit a wall
	#will hopefully make the mobs move back and forth a bit randomly
	
	var dis = randf_range(WANDER_MAX_DISTANCE * -1, WANDER_MAX_DISTANCE)
	var s =  randf_range(MIN_SPEED, MAX_SPEED)
	print("starting to wander dist:%s speed:%s" % [dis, s])
	return Vector2(dis, s)

func chase():
	# chase the player a bit if they enter the raycasts
	pass

func _physics_process(delta):
	
	#if we hit a wall pick a new target
	#if is_on_wall():
	#	print("hit a wall")
	#	wander_target = get_wander_target()
	
	var distance_from_spawn = position.x - spawnPos.x
	  
	var dir = 0
	if (wander_target.x < distance_from_spawn):
		dir = -1
	elif(wander_target.x > distance_from_spawn):
		dir = 1
	else:
		dir = 0
		
		
	if (dir == 0 || dir != prevDir):
		# we hit the target
		print("hit the target")
		velocity.x = move_toward(velocity.x, 0, wander_target.y)
		#pause for some time maybe then pick a new target(how to deal with this)
		wander_target = get_wander_target()
	else:
		velocity.x = wander_target.y * dir
	prevDir = dir
	position += velocity * delta

func _on_body_entered(body):
		#player got hit
	player_hit.emit()
	pass # Replace with function body.
