extends CharacterBody2D

var screen_size # Size of the game window.

@export var speed = 380
@export var Shotcnt = 0.5 #射出間隔
@export var ShotSpeed = 500 #速度
var cnt = 0
const Ball = preload("res://Scene/ball.tscn") #ballシーンのプリロード


func _ready():
	screen_size = get_viewport_rect().size
	position = Vector2(400, 1000)
		
func _physics_process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed(&"move_right"):
		velocity.x += 1
	if Input.is_action_pressed(&"move_left"):
		velocity.x -= 1
	if Input.is_action_pressed(&"move_down"):
		velocity.y += 1
	if Input.is_action_pressed(&"move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	move_and_slide()

	#ballを作成する　スペースを押すとボールが作成されます。
	if Input.is_action_pressed(("ui_select")) || Input.is_action_pressed(("shot")):
		cnt += delta
		if cnt > Shotcnt:
			cnt -= Shotcnt
		
			# ball 
			var Ball = Ball.instantiate()
			Ball.position = position
			
			# ballの位置と速度
			Ball.start(position.x, position.y, ShotSpeed)
			
			#ルートにインスタンスを追加
			var mainNode = get_owner()
			mainNode.add_child(Ball)

#@onready var _camera = $Camera2D # カメラ.
#var _tShake: float = 0 # 画面揺らすタイマー.
func _on_player_3_area_entered(area):
	#print(area.name)
	if "bullet" in area.name:
		
		if Global.life != 0:
			#ヒットストップ
			Engine.set_time_scale(0.1)	
			await get_tree().create_timer(0.1).timeout
			Engine.set_time_scale(1.0)	
			
			Global.life -=1
			print("ライフ："+str(Global.life))
			
			## 画面揺らす
			Global.damage = true
		
		else:
			get_tree().change_scene_to_file("res://Scene/end_game.tscn")
			pass # Replace with function body.
			
			
		#_camera.offset = Vector2.ZERO
		#_tShake -= delta
		#if _tShake > 0:
			#var rate = _tShake / TIMER_SHAKE
			#var vx = 64 * rate
			#var vy = 16 * rate
			#_camera.offset.x = randi_range(-vx, vx)
			#_camera.offset.y = randi_range(-vy, vy)
			## 画面揺れ中はリスタートできなくする.
			#return
	
	
	#if Global.life == 0:
		## ゲームオーバーになる
		#get_tree().change_scene_to_file("res://Scene/end_game.tscn")
		#pass # Replace with function body.
