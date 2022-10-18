extends Node2D
class_name Trade

onready var City_preload = preload("res://scence/map/CitySence.tscn")
var player_check=null
var HP=false
var Damage=false
var Score=false

func _ready():
	if(!get_tree().current_scene.get_node("Sound1").playing):
		get_tree().current_scene.get_node("Sound1").playing=true
func _physics_process(delta):
	var player=get_tree().current_scene.get_node("Player")
	if(player.coin-100>=0):
		if(Input.is_action_just_pressed("ui_accept") and HP and player.life <100):
			$tradesound.play()
			player.life+=10
			player.coin-=100	
		if(Input.is_action_just_pressed("ui_accept") and Score and player.score_multiple<2):
			player.score_multiple+=0.1
			player.coin-=100	
			$tradesound.play()
		if(Input.is_action_just_pressed("ui_accept") and Damage and player.bullet_damage<10):
			player.bullet_damage+=1
			player.coin-=100	
			$tradesound.play()
	if(player_check is Player and Input.is_action_just_pressed("ui_accept")):
		get_tree().current_scene.get_node("map").add_child(City_preload.instance())
		get_tree().current_scene.get_node("Player").position=Vector2(783,583)
		queue_free()	


func _on_Area2D_body_entered(body):
	player_check=body


func _on_Area2D_body_exited(body):
	player_check=null




func _on_HP_body_entered(body):
	HP=true
		


func _on_HP_body_exited(body):
	HP=false


func _on_DAMAGE_body_entered(body):
	Damage=true


func _on_DAMAGE_body_exited(body):
	Damage=false


func _on_SCORE_body_entered(body):
	Score=true


func _on_SCORE_body_exited(body):
	Score=false
