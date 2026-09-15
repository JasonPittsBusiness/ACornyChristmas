extends "res://Collectibles/Collectible.gd"


func _pickup():
	if PlayerStats.corn == 3:
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Menus/EndScene.tscn")
