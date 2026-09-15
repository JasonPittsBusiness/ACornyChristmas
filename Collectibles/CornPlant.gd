extends "res://Collectibles/Collectible.gd"

onready var animationPlayer = $AnimationPlayer

var water: int = 0
var fertilizer: int = 0
var max_stats = false
var ready_to_collect: bool = false

# warning-ignore:unused_argument
func _physics_process(delta: float) -> void:
	update_animations()
	

func _pickup():
	if PlayerStats.water > 30 and PlayerStats.fertilizer > 0 and ready_to_collect == false:
		PlayerStats.water -= 30
		PlayerStats.fertilizer -= 1
		water += 30
		fertilizer += 1
		SoundFx.play("PickupSound")
		print(fertilizer)
	if ready_to_collect == true:
		water = 0
		fertilizer = 0
		PlayerStats.corn += 1
		SoundFx.play("PickupSound")
		animationPlayer.play("Desolate")
		queue_free()


func update_animations():
	if water == 30:
		animationPlayer.play("Planted")
	elif water == 60:
		animationPlayer.play("Medium")
	elif water > 60:
		animationPlayer.play("Grown")
		ready_to_collect = true
	else:
		animationPlayer.play("Desolate")
		ready_to_collect = false
