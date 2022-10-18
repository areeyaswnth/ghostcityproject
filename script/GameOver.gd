extends Node2D

func _ready():
	$sound.play()

func _on_play_pressed(): 
	get_tree().change_scene("res://scence/Game.tscn")


func _on_Home_pressed():
	get_tree().change_scene("res://scence/Menu.tscn")
	pass # Replace with function body.
