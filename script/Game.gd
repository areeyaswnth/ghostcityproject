extends Node2D
onready var player=$Player
onready var city=$map/CitySence
onready var camera=$Player/Camera2D
onready var House1_preload = preload("res://scence/map/House1map.tscn")
onready var House2_preload = preload("res://scence/map/House2map.tscn")
onready var House3_preload = preload("res://scence/map/House3map.tscn")
onready var Trade_preload = preload("res://scence/map/Trade.tscn")
onready var City = preload("res://scence/map/CitySence.tscn")
func _ready():

	pass 

func _physics_process(delta):	
	#print(player.map_location)
	if player.life==0 or Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene("res://scence/GameOver.tscn")
	if Input.is_action_just_pressed("ui_accept") and get_tree().current_scene.get_node("map").get_child(0) is CityScence:
		var city=$map/CitySence

		#get_tree().paused=true
		if(player.map_location=="House1" and !player.house[0]):
			$door.play()
			get_tree().current_scene.get_node("map").add_child(House1_preload.instance())
			player.position=Vector2(771,582)
			camera.zoom=Vector2(1.3,1.3)
			get_tree().current_scene.get_node("map").get_child(0).queue_free()
		if(player.map_location=="House2" and !player.house[1]):
			$door.play()
			camera.zoom=Vector2(1.3,1.3)
			get_tree().current_scene.get_node("map").add_child(House2_preload.instance())
			player.position=Vector2(771,582)
			get_tree().current_scene.get_node("map").get_child(0).queue_free()
		if(player.map_location=="House3" and !player.house[2]):
			$door.play()
			camera.zoom=Vector2(1.3,1.3)
			get_tree().current_scene.get_node("map").add_child(House3_preload.instance())
			player.position=Vector2(771,582)
			get_tree().current_scene.get_node("map").get_child(0).queue_free()
		if(player.map_location=="Trade"):
			$door.play()
			camera.zoom=Vector2(1.3,1.3)
			get_tree().current_scene.get_node("map").add_child(Trade_preload.instance())
			player.position=Vector2(771,582)
			get_tree().current_scene.get_node("map").get_child(0).queue_free()
	elif(get_tree().current_scene.get_node("map").get_child(0) is CityScence):
		camera.zoom=Vector2(1,1)
	if player.house[1] and player.house[2] and player.house[0] and get_node("map").get_child(0) is CityScence :
		get_tree().change_scene("res://scence/GameWin.tscn")
		

	
		
		
		




