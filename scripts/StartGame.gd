extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	Engine.set_time_scale(1.0)	
	CommonE1.emCount == 0
	Global.life = 3
	Global.elapsedTime = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
var counti:int
func _process(delta):
	
	counti +=1
	$start.show()
	if counti > 50:
		$start.hide()
		
		
	if counti > 100:
		counti = 0
	#print("ループ"+str(counti))

#シーンの切り替え
func _input(event: InputEvent) -> void:
	# キーボードのキーが押された場合の処理
	if event is InputEventKey || Input.is_action_pressed(("start")):
		get_tree().change_scene_to_file("res://Scene/main.tscn")
