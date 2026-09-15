extends "res://Collectibles/Collectible.gd"

onready var collectible = $CollisionShape2D
onready var animationPlayer = $AnimationPlayer
onready var waterCollectorTimer = $WaterCollectorTimer


var animations = ["Animate", "Animate2", "Animate3", "Animate4", "Animate5", "Animate6", 
"Animate7", "Animate8", "Animate9", "Animate10"]
export var animation_to_play = 0

func _pickup():
	if PlayerStats.waterCanUnlocked == true:
		if Input.is_action_just_pressed("interact"):
			waterCollectorTimer.start()
			SoundFx.play("PickupSound")
			PlayerStats.water += 30
			collectible.disabled = true


func update_animations():
	animationPlayer.play(str(animations[animation_to_play]))

# warning-ignore:unused_argument
func _process(delta: float) -> void:
	update_animations()


func _on_WaterCollectorTimer_timeout() -> void:
	collectible.disabled = false
