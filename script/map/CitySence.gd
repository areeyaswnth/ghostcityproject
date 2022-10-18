extends Node2D
class_name CityScence
func _ready():
	get_tree().current_scene.get_node("Sound2").playing=false
	if(!get_tree().current_scene.get_node("Sound1").playing):
		get_tree().current_scene.get_node("Sound1").playing=true
	pass
	
