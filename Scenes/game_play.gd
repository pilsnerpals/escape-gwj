extends Node


@onready var bgm = [$bgm1, $bgm2, $bgm3]
var bgm_current = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$bgm1.play()
	get_tree().call_group("coworkers", "init")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_bgm_1_finished():
	$bgm2.play()


func _on_bgm_2_finished():
	$bgm3.play()


func _on_bgm_3_finished():
	$bgm1.play()


