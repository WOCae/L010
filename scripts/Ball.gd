extends Area2D

var velocity = Vector2()

const Window_X = 32  
const Window_Y = 32  
const Window_W = 800 -32
const Window_H = 1380 -32 


func _process(delta):
	if isInScreen(self) == false:

		queue_free() #out
	
	position += velocity * delta

func isInScreen(ball):
	# out
	if ball.position.x < Window_X:
		return false
	if ball.position.y < Window_Y:
		return false
	if ball.position.x > Window_W:
		return false
	if ball.position.y > Window_H:
		return false
	
	return true #in
	

func start(x, y, speed):
	position = Vector2(x, y)
	velocity.x = 0
	velocity.y = -speed
