extends Area2D

var collectable = false

onready var CornStats = ResourceLoader.CornStats
onready var PlayerStats = ResourceLoader.PlayerStats



# warning-ignore:unused_argument
func _physics_process(delta: float) -> void:
	if collectable == true:
		if Input.is_action_just_pressed("interact"):
			_pickup()



func _pickup():
	queue_free()


# warning-ignore:unused_argument
func _on_CollectibleArea_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		collectable = true



# warning-ignore:unused_argument
func _on_CollectibleArea_area_exited(area: Area2D) -> void:
	if area.is_in_group("player"):
		collectable = false

