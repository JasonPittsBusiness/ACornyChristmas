extends Resource
class_name PlayerStats


var min_stat: int = 0
var max_stat: int = 9
var min_water: int = 0
var min_hay: int = 0
var min_corn: int = 0
var max_water: int = 180
var max_corn: int = 3
var max_hay: int = 9

var waterCanUnlocked = false


var fertilizer = min_stat setget set_fertilizer
var water = min_water setget set_water
var hay = min_hay setget set_hay
var corn = min_corn setget set_corn

signal fertilizer_collected
signal water_collected
signal item_collected

func set_fertilizer(value):
	fertilizer = clamp(value, 0, max_stat)


func set_water(value):
	water = clamp(value, 0, max_water)

func set_hay(value):
	hay = clamp(value, 0, max_hay)

func set_corn(value):
	corn = clamp(value, 0, max_corn)

func collect_fertilizer():
	emit_signal("fertilizer_collected")

func collect_water():
	emit_signal("water_collected")

func collect():
	emit_signal("item_collected")
