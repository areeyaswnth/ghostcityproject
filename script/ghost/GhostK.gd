extends KinematicBody2D
class_name GhostK
onready var sprite=$AnimatedSprite
onready var sprite_ef2=$effect/AnimatedSprite2
onready var sprite_ef=$effect
onready var bullet_preload = preload("res://scence/Bullet/Ghost_bullet.tscn")
onready var effect_preload = preload("res://scence/effect/dead.tscn")
onready var hurt_preload = preload("res://scence/effect/hurt.tscn")
onready var timer=$Timer
var ATK=true
var life =1000
var player=null
func _ready():

	sprite_ef.hide()
	sprite.play("default")

func _physics_process(delta):
	if(timer.is_stopped() and player!=null):
		var bullet = bullet_preload.instance()
		bullet.player=player
		bullet.position = position
		bullet.scale=Vector2(0.5,0.5)
		bullet.velocity=(bullet.position*4).direction_to(player.position)	
		get_tree().current_scene.get_node("map").get_node("House3map").get_node("Bullets").add_child(bullet)
		print(bullet.velocity)
		timer.start(0.2)

func _on_Area2D_body_entered(body):
	if body is Player:
		player=body
		sprite_ef.show()
		sprite_ef2.show()
		sprite_ef.play("default")
		sprite_ef2.play("default")
		sprite.play("ATK")
	

 
func damage(amount):
	life -= amount
	var hurt=hurt_preload.instance()
	hurt.position=position
	get_tree().current_scene.get_node("map").get_node("House3map").get_node("effect").add_child(hurt)
	if life <= 0:
		var effect=effect_preload.instance()
		effect.position=position
		get_tree().current_scene.get_node("map").get_node("House3map").get_node("effect").add_child(effect)
		queue_free()
		var player=get_tree().current_scene.get_node("Player")
		var mul_score=player.score_multiple
		player.score +=1000*mul_score
		player.coin+=1000
		player.house[2]=true




func _on_effect_animation_finished():
	sprite_ef.hide()
		
		


func _on_Area2D_body_exited(body):
	if body is Player :
		player=null
		sprite_ef.show()
		sprite_ef2.show()
		sprite_ef.play("default")
		sprite_ef2.play("default")
		sprite.play("default")



func _on_AnimatedSprite2_animation_finished():
	sprite_ef2.hide()
