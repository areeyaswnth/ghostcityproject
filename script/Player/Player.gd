extends KinematicBody2D
class_name Player
onready var sprite = $Sprite
onready var timer = $Timer
onready var invinc_timer= $Invinctime
onready var freeze_time=$Freezetime
onready var healing_time=$Healingtime
onready var location=$location
onready var ice=$Freeze
var house=[false,false,false]

var firerate : float = 0.5
var velocity =Vector2()
var direction =Vector2()
var state=0
var movementSpeed = 5
var life = 100
var score = 0
var score_multiple=1.0
var bullet_damage=1
var freeze=false
var coin=300
var map_location=""
var bullet_preload = preload("res://scence/Bullet/Bullet.tscn")
func _ready():
	sprite.play("default")
	pass 



func _physics_process(delta):
	if(life>100):
		life=100
	read_input()
	if get_tree().current_scene.get_node("map").get_child(0) is CityScence:
		location.show()
		show_location()
	else:
		location.hide()
	if not invinc_timer.is_stopped():
		if int(invinc_timer.time_left * 10)%2==0:
			modulate.a=0.2
		else:
			modulate.a=1
	else:
		modulate.a =1

	

	
func player_shoot():
		$shootsound.play()
		var bullet = bullet_preload.instance()
		bullet.position = position
		bullet.position.y +=20
		bullet.velocity=direction
		
		get_tree().current_scene.get_node("Bullets").add_child(bullet)
		timer.start(firerate)

func update_location(x):
	location.text=x


func damage(amount):
	$hitsound.play()
	if state == 1:
		return
	if not invinc_timer.is_stopped():
		return
	life -= amount
	if life <= 0:
		print("Pleyer is dead")		
		state=1	
	else:	
		invinc_timer.start(2)	
		
		
	
func show_location():
	var location_text =""
	map_location=""
	for index in get_slide_count():
		var collision= get_slide_collision(index)
		location_text = collision.collider.name
		if(location_text=="ground"):
			location_text=""
		elif("House" in location_text):
			map_location=location_text
			location_text=">???"
		elif("city" in location_text):
			location_text=">NOT FOUND"
		elif("shrine" in location_text):
			location_text=">SHRINE cool down:"+str(int(healing_time.time_left))
			if(Input.is_action_pressed("ui_accept") and healing_time.is_stopped()):
				$healsound.play()
				life+=int(rand_range(1,6))*5
				healing_time.start(20)
				#$healingsound.play()
		elif("Trade" in location_text):
			map_location=location_text
			location_text=">TRADE"
		elif("Ghost" in location_text):
			damage(5)	
			location_text=""	
		else:
			location_text=""
	update_location(location_text)
	
func read_input():
	
	velocity=Vector2()
	if Input.is_action_pressed("ui_down"):
		velocity.y+=1
		sprite.play("down")
		direction=Vector2(0,1)
	elif Input.is_action_pressed("ui_up"):
		velocity.y-=1
		direction=Vector2(0,-1)
		sprite.play("up")
	elif Input.is_action_pressed("ui_right"):
		velocity.x+=1
		direction=Vector2(1,0)
		sprite.play("right")
	elif Input.is_action_pressed("ui_left"):
		sprite.play("left")
		velocity.x-=1
		direction=Vector2(-1,0)
	#else:
	#	sprite.playing=false
		#$Sprite.frame=0
	if Input.is_action_pressed("ui_select") and timer.is_stopped() and not freeze:
			player_shoot()	
	if not get_tree().current_scene.get_node("map").get_child(0) is CityScence:
		if(freeze and not freeze_time.is_stopped()):
			ice.show()
			ice.modulate.a = 0.5
			return
		else:	
			freeze_time.start(2)	
			freeze=false
		if(!freeze):
			ice.hide()
	else:
		freeze=false
		ice.hide()		
	velocity = velocity.normalized()

	velocity=move_and_slide(velocity*600)
