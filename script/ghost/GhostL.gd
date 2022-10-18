extends KinematicBody2D
class_name GhostL
var player=null
onready var bullet_preload = preload("res://scence/Bullet/Ghost_bullet.tscn")
onready var effect_preload = preload("res://scence/effect/dead.tscn")
onready var hurt_preload = preload("res://scence/effect/hurt.tscn")
var life=50
onready var timer = $Timer
func _ready():
	pass 
func _physics_process(delta):
	if(timer.is_stopped() and player!=null):
		var bullet = bullet_preload.instance()
		bullet.player=player
		bullet.position = position
		bullet.velocity=position.direction_to(player.position)	
		get_tree().current_scene.get_node("map").get_node("CitySence").get_node("Bullet").add_child(bullet)
		
		timer.start(0.5)

func damage(amount):
	life -= amount
	var hurt=hurt_preload.instance()
	hurt.position=position
	get_tree().current_scene.get_node("map").get_node("CitySence").get_node("effect").add_child(hurt)
	if life <= 0:
		var effect=effect_preload.instance()
		effect.position=position
		get_tree().current_scene.get_node("map").get_node("CitySence").get_node("effect").add_child(effect)
		queue_free()
		var player=get_tree().current_scene.get_node("Player")
		var mul_score=player.score_multiple
		player.score +=50*mul_score
		player.coin+=50


func _on_ghostL_collision_body_entered(body):
	if body is Player:
		player=body	


func _on_ghostL_collision_body_exited(body):
	if body is Player:
		player=null
	if body is Ghost_bullet:
		body.queue_free()





