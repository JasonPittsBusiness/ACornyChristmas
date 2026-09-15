extends KinematicBody2D

var PlayerStats = ResourceLoader.PlayerStats


export var MOVE_SPEED: int = 100
export var MAX_MOVE_SPEED: int = 125
export var ACCELERATION: int = 200


var input_vector: Vector2 = Vector2()
var velocity: Vector2 = Vector2()
var look_direction = Vector2(0, 1)


onready var animationPlayer: AnimationPlayer = $AnimationPlayer
onready var sprite: Sprite = $Sprite
onready var collectorArea := $CollectorArea




var interactable = false


func _ready() -> void:
	pass


func _physics_process(delta: float) -> void:
	move(delta)
	update_animations()



func move(delta):
	input_vector.x = int(Input.get_action_strength("ui_right") - int(Input.get_action_strength("ui_left")))
	input_vector.y = int(Input.get_action_strength("ui_down") - int(Input.get_action_strength("ui_up")))
	velocity = input_vector.normalized() * MOVE_SPEED * ACCELERATION * delta
	velocity = velocity.clamped(MAX_MOVE_SPEED)
	velocity = move_and_slide(velocity)


func update_animations():
	if input_vector.y < 0:
		animationPlayer.play("RunUp")
	elif input_vector.y > 0:
		animationPlayer.play("RunDown")
	elif input_vector.x > 0:
		animationPlayer.play("RunLeftRight")
		sprite.flip_h = false
	elif input_vector.x < 0:
		animationPlayer.play("RunLeftRight")
		sprite.flip_h = true
	else:
		animationPlayer.play("Idle")


func _on_CollectorArea_area_entered(area: Area2D) -> void:
	if area.is_in_group("collectible"):
		interactable = true



# warning-ignore:unused_argument
func _on_CollectorArea_area_exited(CollectibleArea: Area2D) -> void:
	interactable = false
