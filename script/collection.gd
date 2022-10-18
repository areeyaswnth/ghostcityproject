extends Node2D

func _ready():
	pass 



func _on_menu_pressed():
	get_tree().current_scene.get_node("home").show()
	queue_free()
	
	pass 


func _on_Button_pressed():
	$page1.hide()
	$page2.show()
	pass 


func _on_Back_pressed():
	$page1.show()
	$page2.hide()
	pass 
