extends CharacterBody2D

var screen_size # Size of the game window.

@export var speed = 380

func _ready():
	screen_size = get_viewport_rect().size
	
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


func _on_player_3_area_entered(area):
	print(area.name)
	pass # Replace with function body.
