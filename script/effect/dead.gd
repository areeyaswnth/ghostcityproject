extends Node2D

onready var sprite =$AnimatedSprite
onready var status=false
func _ready():
	$dead.play()
	sprite.play("default")
	
func _on_AnimatedSprite_animation_finished():
	queue_free()


func _on_dead_finished():
	status=true
