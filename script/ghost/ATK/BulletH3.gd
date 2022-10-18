extends Area2D
var player=null
onready var lightning_time=$Timer
onready var lightning_sprite=$AnimatedSprite2
onready var ATK=false
var momentspeed=rand_range(30,60)
func _ready():
	
	$shoot_sound.play()
	print(momentspeed)
	lightning_sprite.hide()
	lightning_time.start(10)
	pass 


func _physics_process(delta):
	var body=get_tree().current_scene.get_node("Player")
	var direction=position.direction_to(Vector2((body.position.x/4),(body.position.y/4)+10))
	var velocity = direction.normalized() * momentspeed
	position += velocity * delta
	if lightning_time.is_stopped():
		ATK=true
		$lightning.play()
		lightning_sprite.show()
		lightning_sprite.play("ATK")
	if not get_tree().current_scene.get_node("map").get_node("House3map").get_child(2) is GhostK:
		queue_free()


func _on_BulletH3_body_entered(body):
	if body is Player:
		player=body


func _on_BulletH3_body_exited(body):
	if body is Player:
		player=null


func _on_AnimatedSprite2_animation_finished():
	if ATK:
		queue_free()


func _on_AnimatedSprite2_frame_changed():
	if player!=null and ATK :
		player.damage(5)
		print(1)
