extends Node


@onready var bgm = [$bgm1, $bgm2, $bgm3]
var bgm_current = 0
@onready var coffees
@onready var coworkers
#put in the level length
const levelLengths = [5920, 15120]
var currentLevel = 0
var canSwitch = true
@onready var currentLevelScene = $Level0
# Called when the node enters the scene tree for the first time.
func _ready():
	$bgm1.play()
	handleLevelLoad(currentLevel)
	# hard coded for level 0 need to figure out how to deal with this a better way
	

func handleLevelLoad(levelNum: int):
	coffees = get_tree().get_nodes_in_group("Coffees")
	coworkers = get_tree().get_nodes_in_group("coworkers")
	get_tree().call_group("coworkers", "init")
	for c in coffees:
		c.collected.connect(%Player._on_coffee_collected)
	for w in coworkers:
		w.player_hit.connect(%Player._on_co_worker_player_hit)
	var exits = get_tree().get_nodes_in_group("Exit")
	for e in exits:
		e.player_exited.connect(_onExitReached)
	%ProgressBar.setMaxLength(levelLengths[levelNum])
	
func _onExitReached(level: int):
	if canSwitch:
		%LevelSwitchTimer.start()
		canSwitch = false
		%Player.position = Vector2(57, 721)
		currentLevel += 1;
		#load new scene
		var level_path = "res://Scenes/Level" + str(currentLevel) + ".tscn"
		var level_scene = load(level_path)
		var level_instance = level_scene.instantiate()
		#this is temporary
		
		add_child(level_instance)
		#unload old scene
		currentLevelScene.queue_free()
		currentLevelScene = level_scene
		handleLevelLoad(currentLevel)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	%ProgressBar.setPlayerPos(%Player.position.x)
	#%ProgressBar.setBossPos(%Boss.position.x)
	pass


func _on_bgm_1_finished():
	$bgm2.play()


func _on_bgm_2_finished():
	$bgm3.play()


func _on_bgm_3_finished():
	$bgm1.play()


func _on_level_switch_timer_timeout():
	canSwitch = true
	pass # Replace with function body.
