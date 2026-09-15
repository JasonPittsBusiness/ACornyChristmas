extends "res://Collectibles/Collectible.gd"

func _pickup():
	PlayerStats.waterCanUnlocked = true
	SoundFx.play("PickupSound")
	._pickup()
