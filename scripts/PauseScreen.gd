extends Control

func _ready():
	hide()

func _input(event):
	if event.is_action_pressed("Pause"):
		visible = not visible
		get_tree().paused = not get_tree().paused
	elif event.is_action_pressed("Quit"):
		get_tree().paused = false
		get_tree().change_scene_to_file("res://Scene/start_game.tscn")
