extends Sprite

onready var textSound = $TextSoundPlayer
onready var textDoneSound = $TextDonePlayer
onready var text = $RichTextLabel

signal ready_for_talking

func _ready() -> void:
	visible = true
	get_tree().paused = true


func _on_RichTextLabel_play_sound() -> void:
	textSound.play()


func _on_RichTextLabel_stop_sound() -> void:
	textSound.stop()


func _on_RichTextLabel_text_done() -> void:
	textDoneSound.play()


func _on_RichTextLabel_dialog_done() -> void:
	emit_signal("ready_for_talking")


func _on_GrandpaInteract_talk() -> void:
	text.page = 0
	visible = true
	get_tree().paused = true
