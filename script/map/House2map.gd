extends Node2D

onready var City_preload = preload("res://scence/map/CitySence.tscn")
onready var Storm_preload =preload("res://scence/effect/storm.tscn")
onready var sprite=$GhostT/AnimatedSprite
onready var timer=$Timer
var player =null
var ATK=true
func _ready():
	get_tree().current_scene.get_node("Sound1").playing=false
	if(!get_tree().current_scene.get_node("Sound2").playing):
		get_tree().current_scene.get_node("Sound2").playing=true
	pass 


func _physics_process(delta):	
	if(player is Player and Input.is_action_just_pressed("ui_accept")):
		get_tree().current_scene.get_node("map").add_child(City_preload.instance())
		get_tree().current_scene.get_node("Player").position=Vector2(1596,89)
		queue_free()	
	
	if get_tree().current_scene.get_node("map").get_node("House2map").get_child(2) is GhostT:
		if(not timer.is_stopped() and ATK):
				sprite.play("ATK")	
				#get_tree().current_scene.get_node("map").get_node("House2map").get_node("tornado").add_child(Storm_preload.instance())
		elif(not timer.is_stopped() and not ATK):
			sprite.play("default")
		else:
			var storm=Storm_preload.instance()
			storm.position=$GhostT.position
			get_tree().current_scene.get_node("map").get_node("House2map").get_node("tornado").add_child(storm)
			ATK=!ATK
			timer.start(10)		


func _on_Area2D_body_entered(body):
	player=body



func _on_Area2D_body_exited(body):
	player=null

