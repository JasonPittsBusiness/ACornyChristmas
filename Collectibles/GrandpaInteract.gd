extends "res://Collectibles/Collectible.gd"

onready var cooldown = $CoolDownTimer
signal talk

func _on_DialogBox_ready_for_talking() -> void:
	pass # Replace with function body.


func _pickup():
	if cooldown.time_left == 0:
		emit_signal("talk")
		cooldown.start(15)
