extends Area2D

func setPos(x, y):
	position = Vector2(x, y)
	em_X = x
	em_Y = y
func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		# マウスの入力があった
		if event.is_pressed():
			# オブジェクトを消す
			queue_free()
			CommonE1.emCount -=1

#弾の設定
var Bullet   = preload("res://enemy1/bulletE1.tscn")
var count2:int
var degcount:float
var em_X:float
var em_Y:float

func _physics_process(delta):
	
	count2 = count2 + 1		
	if count2 == 1:
		#for i in range(1):
		for i in range(2):
			pass
			#degcount += 10 +delta*10 #発射角度
			degcount +=10
			bullet(position.x,position.y,-90+degcount, 100, 1)
		await get_tree().create_timer(0.5).timeout
		count2 = 0

# 弾を撃つ
func bullet(em_X,em_Y,deg, speed, delay=1):
	if delay > 0:
		# 遅延して発射する
		await get_tree().create_timer(delay).timeout
	
	var bullet = Bullet.instantiate()
	bullet.start(0, 0, deg, speed)
	# ルートノードを取得
	add_child(bullet)
