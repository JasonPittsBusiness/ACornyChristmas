extends Node

func spawn_on_main(scene, position):
	var main_scene = get_tree().current_scene
	var instance = scene.instance()
	main_scene.add_child(instance)
	instance.global_position = position
	return instance
