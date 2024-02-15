extends Node2D

var map2 = preload("res://stage1/s_map_2.tscn")


func _ready():
	var map2 = map2.instantiate()
	self.add_child(map2)
	
	
	pass

var map2Flag:bool

func _process(delta):
	
	var cnt = 0 #MAP2のカウント
	
	#-----ツリーのノード名を検索
	for child in get_children():
		#print(child.name)
		if "MAP2" in child.name:
			cnt += 1
			map2Flag = true
			#print("MAP2" + str(cnt))
	#print("個数：" + str(cnt))
	if cnt == 0:
		#print("NoMAP2" )
		map2Flag = false
		pass
	#----------------------

	if map2Flag == false:
		var map2 = map2.instantiate()
		map2.position.x = randum(160,640) #出現位置を
		self.add_child(map2)


func randum(min_value,max_value):
	#var random_number = randi(10)
	#print(random_number) # 例：5

	#var min_value = 0
	#var max_value = 800
	var random_number = randi_range(min_value, max_value)
	#print(random_number) # 例：12
	return random_number
