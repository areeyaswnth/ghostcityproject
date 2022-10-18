extends Node2D

onready var ghostU_preload = preload("res://scence/ghost/GhostU.tscn")
onready var ghostL_preload =preload("res://scence/ghost/GhostL.tscn")
onready var timer = $Timer

var spawn_rate: float = 10

func _ready():
	pass
func _process(_delta):
	if timer.is_stopped():
		var ghostU = ghostU_preload.instance()
		var ghostL = ghostL_preload.instance()
		ghostU.position = Vector2(rand_range(11, 2538),rand_range(-823, 1022))
		ghostL.position = Vector2(rand_range(11, 2538),rand_range(-823, 1022))
		if get_tree().current_scene.get_node("map").get_node("CitySence").get_node("Ghost").get_child_count() <30:
			var n=int(rand_range(1,3))
			if n==1:
				get_tree().current_scene.get_node("map").get_node("CitySence").get_node("Ghost").add_child(ghostU)
				get_tree().current_scene.get_node("map").get_node("CitySence").get_node("Ghost").add_child(ghostL)
			else:
				get_tree().current_scene.get_node("map").get_node("CitySence").get_node("Ghost").add_child(ghostL)
				get_tree().current_scene.get_node("map").get_node("CitySence").get_node("Ghost").add_child(ghostU)
		timer.start(spawn_rate)
	
