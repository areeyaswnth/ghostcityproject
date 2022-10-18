extends Node2D

onready var bg=$bg
var speed = 1000
func _ready():
	pass 
func _physics_process(delta):
	bg.position.x -= 100 * delta
	if bg.position.x <= -2128:
		bg.position.x = 0
