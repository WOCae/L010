extends StaticBody2D

var velocity = Vector2()
func _process(delta):
	
	velocity.y = 1000

	position += velocity * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	pass # Replace with function body.
