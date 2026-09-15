extends "res://Collectibles/Collectible.gd"



func _pickup():
	PlayerStats.hay += 1
	SoundFx.play("PickupSound")
	queue_free()


