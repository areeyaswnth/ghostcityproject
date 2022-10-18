extends Node2D

func _on_menu_pressed():
	get_tree().current_scene.get_node("home").show()
	queue_free()
	
	pass

