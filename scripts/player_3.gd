extends CharacterBody2D
class_name Player3

var screen_size # Size of the game window.

@export var speed = 380
@export var Shotcnt = 0.3 #射出間隔
@export var ShotSpeed = 800 #速度
var cnt = 0
const Ball = preload("res://Scene/ball.tscn") #ballシーンのプリロード


func _ready():
	screen_size = get_viewport_rect().size
	position = Vector2(400, 1000)
	#弾
	Global.ballScal_X = 1
	Global.ballScal_Y = 1
	
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
		print(cnt,":",Shotcnt)
		if cnt > Shotcnt:
			cnt -= Shotcnt
			#cnt = 0	
			
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
	
	#if "bullet" in area.name:
	if area is BulletE1:
		
		if Global.life > 0:
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
			#pass # Replace with function body.
	
	##if area in Item:
	#if area is Item:
	##if "Item" in area.name:
		#print(area.name)
		#speed += 100
		#
		##var collision_shape2d = get_node("CollisionShape2D")
#
		## 衝突形状のスケールをX軸方向に2倍、Y軸方向に3倍に設定
		##$CollisionShape2D.scale = Vector2(2, 3)
		#Global.ballScal_X += 2
		#Global.ballScal_Y += 2
#
		#Global.itmeCount +=1
		


func _on_player_3_area_entered2(area):
	#if area in Item:
	if area is Item:
	#if "Item" in area.name:
		print(area.name)
		speed += 100
		
		#var collision_shape2d = get_node("CollisionShape2D")

		# 衝突形状のスケールをX軸方向に2倍、Y軸方向に3倍に設定
		#$CollisionShape2D.scale = Vector2(2, 3)
		Global.ballScal_X += 2
		Global.ballScal_Y += 2

		Global.itmeCount +=1
