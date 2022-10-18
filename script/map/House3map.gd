extends Node2D

onready var City_preload = preload("res://scence/map/CitySence.tscn")
onready var ATK_player_preload =preload("res://scence/Bullet/BulletH3.tscn")
onready var ATKtimer=$Timer
onready var ATK=false
var player =null

func _ready():
	get_tree().current_scene.get_node("Sound1").playing=false
	if(!get_tree().current_scene.get_node("Sound2").playing):
		get_tree().current_scene.get_node("Sound2").playing=true
	ATKtimer.start(2)
	pass 


func _physics_process(delta):	
	if(player is Player and Input.is_action_just_pressed("ui_accept")):
			get_tree().current_scene.get_node("map").add_child(City_preload.instance())
			get_tree().current_scene.get_node("Player").position=Vector2(705,883)
			queue_free()
	if(get_tree().current_scene.get_node("map").get_node("House3map").get_child(2) is GhostK):
		if( ATKtimer.is_stopped() ):
			var body=get_tree().current_scene.get_node("Player")
			var ATK_player=ATK_player_preload.instance()
			ATK_player.position=body.position/4
			ATK_player.position.y+=10
			get_node("atk").add_child(ATK_player)
			ATKtimer.start(2)
			ATK=!ATK

		
		
		

func _on_Area2D_body_entered(body):
	player=body

	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	player=null
	pass # Replace with function body.


func _on_room_body_entered(body):
	#player_pos=body.position
	
	pass # Replace with function body.
