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
var bulletOUT:int
var bulletOUT2:int
func _physics_process(delta):
	
	count2 = count2 + 1		
	if count2 == 1:
		#for i in range(1):
		for i in range(bulletsetting(Global.elapsedTime)):
			pass
			#degcount += 10 +delta*10 #発射角度
			degcount +=10
			bullet(position.x,position.y,-90+degcount, bulletsetting2(Global.elapsedTime), 1)
		await get_tree().create_timer(0.5).timeout
		count2 = 0

# 弾を撃つ
var bcnt = 0
func bullet(em_X,em_Y,deg, speed, delay=1):
	if delay > 0:
		# 遅延して発射する
		await get_tree().create_timer(delay).timeout
	
	var bullet = Bullet.instantiate()
	bullet.start(em_X, em_Y, deg, speed)
	bcnt += 1
	bullet.name = "bullet" + str(bcnt)
	# ルートノードを取得
	add_child(bullet)

#経過時間による値
func bulletsetting(Etime):
	
	if Etime < 10:
		bulletOUT = 2
		pass
	elif Etime > 10 && Etime < 20:
		bulletOUT = 5
		pass
	elif Etime > 20 && Etime < 30:
		bulletOUT = 10
		pass
	elif Etime > 30 && Etime < 40:
		bulletOUT = 20
		pass
	
	pass
	
	return bulletOUT

#弾速
func bulletsetting2(Etime):
	
	if Etime < 10:
		bulletOUT2 = 100
		pass
	elif Etime > 10 && Etime < 20:
		bulletOUT2 = 200
		pass
	elif Etime > 20 && Etime < 30:
		bulletOUT2 = 300
		pass
	elif Etime > 30 && Etime < 40:
		bulletOUT2 = 400
		pass
	
	pass
	
	return bulletOUT2


func _on_area_entered(area):
	#print(area.name)
	#if area.name == "Ball":
	#if area is Ball:
		#queue_free()	
	pass # Replace with function body.
