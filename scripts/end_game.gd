extends Control

func _input(event):
	if event.is_action_released("Quit"):
		get_tree().quit()
	elif event.is_action_released("ui_accept")|| Input.is_action_pressed(("start")):
		get_tree().change_scene_to_file("res://Scene/start_game.tscn")
