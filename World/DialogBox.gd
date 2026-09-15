extends RichTextLabel

var dialog = ["Hey Marcy, your grandma just called and the store is out of popcorn!", 
"We won’t have any for our Christmas movie tonight...",
"Wait!",
"I still have some corn seeds from when I used to be a farmer.",
"Here you go.",
"You can use these spots where I used to grow things but they're pretty desolate now…",
"See if you can gather some water and fertilizer.",
"Each plant will need a lot of fertilizer to grow in time... at least 3.",
"I'm sure we can get enough corn grown before grandma gets home.",
"You can move around with WASD and pick things up with SPACEBAR.",
"Head over to the house when you've gotten 3 corn for us.",
"Now where did I leave that old watering can....",
"..."]
var page = 0

signal play_sound
signal stop_sound
signal text_done
signal dialog_done

onready var dialogBox = get_parent()
var dialog_starting = true


func _ready() -> void:
	if dialog_starting == true:
		set_bbcode(dialog[page])
		set_visible_characters(0)
		set_process_input(true)
		dialogBox.visible = true


# warning-ignore:unused_argument
func _process(delta: float) -> void:
	unpause()


func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed():
		if get_visible_characters() > get_total_character_count():
			if page < dialog.size() - 1:
				emit_signal("text_done")
				page += 1
				set_bbcode(dialog[page])
				set_visible_characters(0)
		else:
			set_visible_characters(get_total_character_count())
			emit_signal("text_done")


func _on_Timer_timeout() -> void:
	set_visible_characters(get_visible_characters() + 1)
	if get_visible_characters() < get_total_character_count():
		emit_signal("play_sound")
	if get_visible_characters() == get_total_character_count():
		emit_signal("stop_sound")

func unpause():
	if page == int(dialog.size() - 1):
		get_tree().paused = false
		dialogBox.visible = false
		emit_signal("dialog_done")
