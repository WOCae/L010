extends Node2D

var lastPosi_X:float
var lastPosi_Y:float
var timeCount:float

func _ready():
	CommonE1.emCount = 0
	Global.life = 3
func _process(delta):
	#print(delta)
	#位置を調べる
	if $Player3.position.x== lastPosi_X && $Player3.position.y== lastPosi_Y:
		timeCount += delta

	else:
		timeCount = 0

	lastPosi_X = $Player3.position.x
	lastPosi_Y = $Player3.position.y
	$HUD/time.text = "%7.1f" % timeCount #7は全文字数（.を含む）1は小数点以下数
	#カウント5以上で画面遷移
	if timeCount >= 5:
		get_tree().change_scene_to_file("res://Scene/end_game.tscn")



func _on_map_area_entered(area):
	if area.name == "Player3":
		Global.life -=1
	
	if Global.life == 0:
		# ゲームオーバーになる
		get_tree().change_scene_to_file("res://Scene/end_game.tscn")
