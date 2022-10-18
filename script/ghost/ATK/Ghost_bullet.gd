extends KinematicBody2D
var player=null
var velocity =Vector2()
onready var sprite=$AnimatedSprite
class_name Ghost_bullet
func _ready():
	$shoot_sound.play()		

	
func _physics_process(delta):	
	velocity =velocity.normalized()
	velocity=move_and_slide(velocity*300)
	var location_text =""
	for index in get_slide_count():
		var collision= get_slide_collision(index)
		location_text = collision.collider.name

	if(location_text == "ground" ):
		queue_free()


func _on_Area2D_body_entered(body):
	if body is Player:	
		body.damage(5)
		queue_free()



