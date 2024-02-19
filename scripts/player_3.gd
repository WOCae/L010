extends CharacterBody2D

var screen_size # Size of the game window.

@export var speed = 380
@export var Shotcnt = 0.5 #射出間隔
@export var ShotSpeed = 1000 #速度
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


func _on_player_3_area_entered(area):
	print(area.name)
	Global.life -=1
	
	if Global.life == 0:
		# ゲームオーバーになる
		get_tree().change_scene_to_file("res://Scene/end_game.tscn")
	pass # Replace with function body.
