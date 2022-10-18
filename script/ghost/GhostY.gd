extends KinematicBody2D

class_name GhostY
var player=null
onready var bullet_preload = preload("res://scence/Bullet/Ghost_bullet2.tscn")
onready var effect_preload = preload("res://scence/effect/dead.tscn")
onready var hurt_preload = preload("res://scence/effect/hurt.tscn")
var life=1000
var velocity =Vector2()
onready var timer = $Timer
onready var sprite=$AnimatedSprite
func _ready():
	pass 
func _physics_process(delta):
	if(timer.is_stopped() and player!=null):
		var bullet = bullet_preload.instance()
		bullet.player=player
		bullet.position = position
		bullet.velocity=position.direction_to(player.position)			

		get_tree().current_scene.get_node("map").get_node("House1map").get_node("Bullet").add_child(bullet)
		timer.start(0.4)

func damage(amount):
	life -= amount
	var hurt=hurt_preload.instance()
	hurt.position=Vector2(position.x-20,position.y+50)
	hurt.scale=Vector2(0.7,0.7)
	get_tree().current_scene.get_node("map").get_node("House1map").get_node("effect").add_child(hurt)
	print(life)
	if life <= 0:
		var dead=effect_preload.instance()
		dead.position=position
		dead.scale=Vector2(1.5,1.5)
		get_tree().current_scene.get_node("map").get_node("House1map").get_node("effect").add_child(dead)
		queue_free()
		var player=get_tree().current_scene.get_node("Player")
		var mul_score=player.score_multiple
		player.score +=1000*mul_score
		player.coin+=500
		player.house[0]=true


func _on_ghostY_collision_body_entered(body):
	if body is Player:
		sprite.play("ATK")
		player=body	


func _on_ghostY_collision_body_exited(body):
	if body is Player:
		sprite.play("default")
		player=null
	if body is Ghost_bullet:
		body.queue_free()



