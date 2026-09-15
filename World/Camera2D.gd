extends Camera2D


# warning-ignore:unused_argument
func _on_Area2D_area_entered(CameraChanger: Area2D) -> void:
	self.current = true
