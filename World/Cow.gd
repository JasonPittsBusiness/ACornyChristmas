extends "res://NPC/NPC.gd"

onready var spawnTimer = $SpawnerTimer
onready var spawnPos = $PoopSpawnPosition
const poop = preload("res://Collectibles/Fertilizer.tscn")
var food_eaten: int = 0

onready var PlayerStats = ResourceLoader.PlayerStats



func spawn_poop():
	if food_eaten > 0:
		food_eaten -= 1
		Spawner.spawn_on_main(poop, spawnPos.global_position)
		SoundFx.play("CowPoop")
	pass


func _on_SpawnerTimer_timeout() -> void:
	spawn_poop()


func _on_CowInteract_food_was_eaten() -> void:
	if PlayerStats.hay > 0:
		spawnTimer.start()
		SoundFx.play("CowEating")
		PlayerStats.hay -= 1
		food_eaten += 1
