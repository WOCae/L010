extends Node2D

var lastPosi_X:float
var lastPosi_Y:float
var timeCount:float
var latetimeCount:float

#カメラ
@onready var _camera = $Camera2D # カメラ.
var _tShake: float = 0 # 画面揺らすタイマー.
const TIMER_SHAKE = 1.5 # 0.5秒の間揺らす


func _ready():
	CommonE1.emCount = 0
	_camera.offset = Vector2.ZERO
	_tShake = 0
	Global.damage = false
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
	$HUD/life.text =str(Global.life)
	Global.elapsedTime += delta	
	$HUD/elapsed_time.text = "%7.1f" % Global.elapsedTime
	#カウント5以上で画面遷移
	if timeCount >= 5:
		get_tree().change_scene_to_file("res://Scene/end_game.tscn")

	#カメラの動き
	#if Input.is_action_pressed(("start")):
	if Global.damage == true:
	# 画面揺らす
		_camera.offset = Vector2.ZERO
		_tShake -= delta
		print(_tShake)
		if _tShake < 0 &&  _tShake > -0.1 :
			var rate = _tShake / TIMER_SHAKE*10
			var vx = 64 * rate
			var vy = 16 * rate
			_camera.offset.x = randi_range(-vx, vx)
			_camera.offset.y = randi_range(-vy, vy)
			# 画面揺れ中はリスタートできなくする.
			#Global.damage = false
			#_camera.offset = Vector2.ZERO
			#_tShake = 0
			return
		if _tShake < -0.5 :
			_camera.offset = Vector2.ZERO
			_tShake = 0
			Global.damage = false
	
	
func _on_map_area_entered(area):
	if area.name == "Player3":
		Global.life -=1
	
	if Global.life == 0:
		# ゲームオーバーになる
		get_tree().change_scene_to_file("res://Scene/end_game.tscn")
