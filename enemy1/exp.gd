extends Sprite2D

# 演出速度.
const SPEED = 34*2 # 37パターンで1秒,

# 経過時間.
var _pasttime = 0.0

func _ready() -> void:
	#position = Vector2(100, 100)
	scale =  Vector2(2,2)	#サイズ

	## 音量を50%に設定
	#$AudioStreamPlayer2D.volume_db = 30.0206
	
## 更新.
func _process(delta: float) -> void:
	# 経過時間を足し込む.
	_pasttime += delta
	#$AudioStreamPlayer2D.play()
	frame = int(_pasttime * SPEED)
	if frame >= 30:
		# アニメーションが終わったら消す.
		queue_free()

	
func start(x, y, deg, speed):
	position.x = x
	position.y = y

