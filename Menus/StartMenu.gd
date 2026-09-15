extends Control

onready var timer = $Timer

func _on_Button_pressed() -> void:
# warning-ignore:return_value_discarded
	timer.start()
	SoundFx.play("Confirm")



func _on_Button2_pressed() -> void:
	get_tree().quit()


func _on_Timer_timeout() -> void:
	get_tree().change_scene("res://World/World.tscn")
