extends Control

var velocity =Vector2()
var direction =Vector2()
onready var game_name =$Label



func _physics_process(delta):
	
	var player=get_tree().current_scene.get_node("Player")
	$HP.text = "HP :"+str(player.life)
	$skil.text ="DAMAGE x " +str(player.bullet_damage)+"/10"+" SCORE x"+str(player.score_multiple)+"/2"
	$score.text="SCORE : "+add_zero(str(int(player.score)),6)+str(player.score)
	$coin.text="COIN : "+add_zero(str(player.coin),6)+str(player.coin)+"¥"
func add_zero(string,zero):
	var text=""
	for i in range(zero-len(string)):
		text+="0"
	return text
	
