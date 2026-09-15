extends "res://Collectibles/Collectible.gd"


signal food_was_eaten

func _pickup():
	emit_signal("food_was_eaten")


