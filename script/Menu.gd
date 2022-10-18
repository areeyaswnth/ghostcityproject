extends Node2D
onready var Collection_preload=preload("res://scence/collection.tscn")
onready var Tutorial_preload=preload("res://scence/Tutorial.tscn")
func _on_Start_pressed():
	get_tree().change_scene("res://scence/Game.tscn")
	pass # Replace with function body.


func _on_Story_pressed():
	$home.hide()
	get_tree().current_scene.add_child(Collection_preload.instance())


func _on_Tutorial_pressed():
	$home.hide()
	get_tree().current_scene.add_child(Tutorial_preload.instance())

