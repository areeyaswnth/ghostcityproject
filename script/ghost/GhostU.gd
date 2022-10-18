extends KinematicBody2D
class_name GhostU
var velocity :Vector2=Vector2()
var direction :Vector2=Vector2()
onready var effect_preload = preload("res://scence/effect/dead.tscn")
onready var hurt_preload = preload("res://scence/effect/hurt.tscn")
var dirX:int= rand_range(-5,5)
var dirY:int= rand_range(-5,5)
var player=null
var life=100
func _ready():
	pass
func _physics_process(delta):	
	ghost_move()
	
func ghost_pos():
	var location_text =""
	for index in get_slide_count():
		var collision= get_slide_collision(index)
		location_text = collision.collider.name

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

	
func ghost_move():
	var direction = Vector2(0,0)
	direction.x = dirX
	direction.y = dirY
	velocity.y+=dirY
	velocity.x+= dirX
	if(player!=null):
		velocity=position.direction_to(player.position)
		velocity = velocity.normalized()
		velocity=move_and_slide(velocity*150)
		return
	velocity = velocity.normalized()
	velocity=move_and_slide(velocity*150)
	var location_text =""
	for index in get_slide_count():
		var collision= get_slide_collision(index)
		location_text = collision.collider.name
	if("Player"in location_text  ):
		dirX=0
		dirY=0	
	elif(location_text !=""):		
		dirX= rand_range(-5,5)
		dirY= rand_range(-5,5)


	

func _on_Ghost_body_entered(body):
	if body is Player:
		player=body	


func _on_Ghost_body_exited(body):
	if body is Player:
		player=null
