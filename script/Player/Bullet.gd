extends KinematicBody2D
class_name Bullet
var velocity =Vector2()
var bullet_damage=5
func _ready():
	pass 
func _physics_process(delta):
	var player=get_tree().current_scene.get_node("Player")
	bullet_damage=5*player.bullet_damage
	velocity = velocity.normalized()
	velocity=move_and_slide(velocity*500)
	var location_text =""
	for index in get_slide_count():
		var collision= get_slide_collision(index)
		location_text = collision.collider.name
		
	if(location_text == "ground" or "Bullet"in location_text or "storm"in location_text):
		queue_free()
	
func _on_Area2D_body_entered(body):
	
	if("GhostL" in body.get_name()):
		body.damage(bullet_damage)
		queue_free()
	elif("GhostU" in body.get_name()):
		body.damage(bullet_damage)
		queue_free()
	elif("GhostY" in body.get_name()):
		body.damage(bullet_damage)
		queue_free()
	elif("GhostT" in body.get_name()):
		body.damage(bullet_damage)
		queue_free()
	elif("GhostK" in body.get_name()):
		body.damage(bullet_damage)
		queue_free()
