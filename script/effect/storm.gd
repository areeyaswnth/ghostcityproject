extends KinematicBody2D
var dirX:int= rand_range(-5,5)
var dirY:int= rand_range(-5,5)
var velocity :Vector2=Vector2()
var player=null

func _ready():
	$stormsound.play()
	pass 
func _physics_process(delta):	
	storm_move()
	
func storm_move():
	var direction = Vector2(0,0)
	direction.x = dirX
	direction.y = dirY
	velocity.y+=dirY
	velocity.x+= dirX
	velocity = velocity.normalized()
	velocity=move_and_slide(velocity*250)
	var location_text =""
	for index in get_slide_count():
		var collision= get_slide_collision(index)
		location_text = collision.collider.name
	#if(location_text)
	if(location_text !=""):		
		dirX= rand_range(-5,5)
		dirY= rand_range(-5,5)
		
	if( not get_tree().current_scene.get_node("map").get_node("House2map").get_child(2)  is GhostT ):
		queue_free()



func _on_Area2D_body_entered(body):
	if body is Player:
		player=body	
		body.damage(5)



func _on_Area2D_body_exited(body):
	if body is Player:
		player=null
	if body is Bullet:
		body.queue_free()
