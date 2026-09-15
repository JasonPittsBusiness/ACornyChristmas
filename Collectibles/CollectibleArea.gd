extends Area2D


func _pickup():
	if Input.is_action_pressed("interact"):
		queue_free()
