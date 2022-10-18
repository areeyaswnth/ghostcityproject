extends Node2D

onready var City_preload = preload("res://scence/map/CitySence.tscn")
var player =null
func _ready():
	get_tree().current_scene.get_node("Sound1").playing=false
	if(!get_tree().current_scene.get_node("Sound2").playing):
		get_tree().current_scene.get_node("Sound2").playing=true
	pass 


func _physics_process(delta):	
	if(player is Player and Input.is_action_just_pressed("ui_accept")):
		get_tree().current_scene.get_node("map").add_child(City_preload.instance())
		get_tree().current_scene.get_node("Player").position=Vector2(559,-196)
		queue_free()

func _on_Area2D_body_entered(body):
	player=body

	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	player=null
	pass # Replace with function body.
