extends KinematicBody2D
class_name GhostT
var life=1000
onready var effect_preload = preload("res://scence/effect/dead.tscn")
onready var hurt_preload = preload("res://scence/effect/hurt.tscn")

func _ready():
	pass 

func damage(amount):
	life -= amount
	var hurt=hurt_preload.instance()
	hurt.position=position
	hurt.scale=Vector2(0.3,0.3)
	get_tree().current_scene.get_node("map").get_node("House2map").get_node("effect").add_child(hurt)
	if life <= 0:
		var dead=effect_preload.instance()
		dead.position=position
		dead.scale=Vector2(0.8,0.8)
		get_tree().current_scene.get_node("map").get_node("House2map").get_node("effect").add_child(dead)
		queue_free()
		var player=get_tree().current_scene.get_node("Player")
		var mul_score=player.score_multiple
		player.score +=1000*mul_score
		player.coin+=500
		player.house[1]=true
