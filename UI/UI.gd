extends CanvasLayer

var PlayerStats = ResourceLoader.PlayerStats

onready var fertilizer = $Control/Fertilizer
onready var waterBar = $WaterBar
onready var hay = $Control/Hay
onready var corn = $Control/Corn



func _ready() -> void:
	waterBar.visible = false



# warning-ignore:unused_argument
func _physics_process(delta: float) -> void:
	fertilizer.text = str(PlayerStats.fertilizer)
	waterBar.value = PlayerStats.water
	hay.text = str(PlayerStats.hay)
	corn.text = str(PlayerStats.corn)
	
	if PlayerStats.waterCanUnlocked == true:
		waterBar.visible = true



