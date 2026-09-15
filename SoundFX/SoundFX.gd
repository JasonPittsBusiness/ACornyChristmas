extends Node

onready var sound_players = get_children()
var sounds_path = "res://SoundFX/"

var sounds = {
	"PickupSound" : load(sounds_path + "PickupSound.wav"),
	"CowEating" : load(sounds_path + "CowEating.wav"),
	"CowPoop" : load(sounds_path + "CowPoop.wav"),
	"Confirm" : load(sounds_path + "TextSoundDoneFX.wav")
}

func play(sound_string):
	for soundPlayer in sound_players:
		if not soundPlayer.playing:
			soundPlayer.stream = sounds[sound_string]
			soundPlayer.play()
			return
