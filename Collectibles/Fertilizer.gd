extends "res://Collectibles/Collectible.gd"

func _pickup():
	PlayerStats.fertilizer += 1
	SoundFx.play("PickupSound")
	.queue_free()
