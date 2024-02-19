extends Area2D

var posScale = 5
func _physics_process(delta):
	pass
	#if Input.is_action_pressed(&"move_right"):
		#position.x += 1*posScale
	#if Input.is_action_pressed(&"move_left"):
		#position.x -= 1*posScale
	#if Input.is_action_pressed(&"move_down"):
		#position.y += 1*posScale
	#if Input.is_action_pressed(&"move_up"):
		#position.y -= 1*posScale

#var screen_size # Size of the game window.
#
#@export var speed = 80
#
#func _ready():
	#screen_size = get_viewport_rect().size
	#
#func _physics_process(delta):
	#var velocity = Vector2.ZERO # The player's movement vector.
	#if Input.is_action_pressed(&"move_right"):
		#velocity.x += 1
	#if Input.is_action_pressed(&"move_left"):
		#velocity.x -= 1
	#if Input.is_action_pressed(&"move_down"):
		#velocity.y += 1
	#if Input.is_action_pressed(&"move_up"):
		#velocity.y -= 1
#
	#if velocity.length() > 0:
		#velocity = velocity.normalized() * speed
		#
	#position += velocity * delta
	#position = position.clamp(Vector2.ZERO, screen_size)
	#
	#move_and_slide()


