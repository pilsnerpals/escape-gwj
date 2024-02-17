extends Node
## world container that holds global vars between individual levels (worlds within worlds)
##
## gets screen_size from settings
## observes/creates/unloads levels based on current level_number
## emits/rcvs is_switching_level for transitional animations/etc
## @tutorial(TitleHere):		https://theurl.com
## @experimental or ## @deprecated

# I have yet to review gdscript syntax
var level_number = 1
var screen_size = Vector2()
var is_switching_level = false

func _ready():
	## sets screen size and loads current level
	## screen size should probably be handled elsewhere
	screen_size = 300
	load_level(level_number)

func load_level(level):
	var level_path = "res://Scenes/Level" + str(level) + ".tscn"
	var level_scene = load(level_path)
	var level_instance = level_scene.instantiate()
	add_child(level_instance)
	is_switching_level = false
	
	var player = get_node("Node2D/Player")
	var entry_pos = Vector2(0,0)

func switch_level():
	if is_switching_level:
		return

	is_switching_level = true
	level_number += 1

	# fetch player node "Player"
	var player = get_node("Node2D/Player")
	
	#unload old 2DNode level
	get_node("Node2D").queue_free()
	load_level(level_number)

func _process(delta):
	# Check if the player crosses the screen boundary
	var player = get_node("Node2D/Player")

	if player:
		var player_position = player.position
		var level_complete = player_position.x > 500

		if level_complete:
			switch_level()
