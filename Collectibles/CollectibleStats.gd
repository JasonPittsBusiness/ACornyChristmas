extends Node


signal item_was_collected


export var collectable: int = 1
onready var not_collectable = collectable setget set_not_collectable


func set_not_collectable(value):
	not_collectable = clamp(value, 0, collectable)
	if not_collectable == 0:
		emit_signal("item_was_collected")


