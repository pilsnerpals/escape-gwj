extends Control

@export var playerPos: float = 0
@export var bossPos: float = 0
@export var maxLen: float = 1200
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func setPlayerPos(x: float):
	playerPos = x
func setBossPos(x: float):
	bossPos = x
func setMaxLength(x: float):
	maxLen = x
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	%PlayerTracker.position.x = ((playerPos / maxLen) * 400) - 200
	%BossTracker.position.x = ((bossPos / maxLen) * 400) - 200
	pass
