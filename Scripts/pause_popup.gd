extends Popup

signal pause_quit()

func _ready():
	hide()
	pass

# stop pressing pause twice blink

func _input(event):
	if event.is_action_released("game_pause"):
		rpc("pauseGame")
		$VBoxContainer.show()
		$VBoxContainer/unpause/.grab_focus()


func _on_unpause_pressed():
	rpc("resumeGame")
	
func _on_quit_pressed():
	get_tree().paused = false
	emit_signal("pause_quit")

sync func pauseGame():
	get_tree().paused = true
	$VBoxContainer.hide()
	popup()
	
sync func resumeGame():
		get_tree().paused = false
		hide()