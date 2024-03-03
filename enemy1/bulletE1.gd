extends Area2D
class_name BulletE1
# 移動方向
var velocity = Vector2()
var em_X
var em_Y

func _ready():
	pass
	
# 開始
func start(x, y, deg, speed):
	#position = Vector2(x, y)
	velocity.x = speed * cos(deg_to_rad(deg))
	velocity.y = speed * -sin(deg_to_rad(deg))
	em_X = x
	em_Y = y
#func _process(delta):
	#position += velocity * delta
func _physics_process(delta):
	position += velocity * delta
	
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

	pass # Replace with function body.

## 爆発シーンを読み込む
const EXPLOSION_OBJ = preload("res://enemy1/exp.tscn")
const SE_OBJ = preload("res://enemy1/se_exp.tscn")
func _on_area_entered(area):
	#print("bullet:"+area.name)
	if area.name == "MAP" || area.name == "map":
		queue_free()
		#$AudioStreamPlayer2D.play()
	if area is Ball:

		#print(position)
		# 爆発エフェクトを再生.
		var explosion = EXPLOSION_OBJ.instantiate()
		# 同じ座標に移動.
		explosion.position = position
		explosion.start(position.x+em_X, position.y+em_Y, 0, 0)
		#print(em_X,em_Y)
		# ルートノードに爆発オブジェクトを登録する
		get_tree().root.add_child(explosion)
		
		queue_free() #bulletの削除
		
		#爆発音の登録
		var SE_explosion = SE_OBJ.instantiate()
		#ルートノードに爆発オブジェクトを登録する
		get_tree().root.add_child(SE_explosion)
		SE_explosion.play()
		await SE_explosion.finished
		SE_explosion.queue_free()
