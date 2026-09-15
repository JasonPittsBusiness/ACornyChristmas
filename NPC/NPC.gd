extends KinematicBody2D

var MOVE_SPEED: int = 1000
onready var rightWallCheck: RayCast2D = $RightWallCheck
onready var leftWallCheck: RayCast2D = $LeftWallCheck
onready var upWallCheck: RayCast2D = $UpWallCheck
onready var downWallCheck: RayCast2D = $DownWallCheck
onready var timer = $Timer
onready var animationPlayer = $AnimationPlayer
onready var sprite = $Sprite


enum {
	IDLE,
	NEW_DIRECTION,
	MOVE
}

var state = IDLE
var direction := Vector2()
var velocity := Vector2()

var right := Vector2(1, 0)
var left := Vector2(-1, 0)
var up := Vector2(0, -1)
var down := Vector2(0, 1)

func _ready() -> void:
	direction = choose([up, down, left, right])
	randomize()

func _physics_process(delta: float) -> void:
	update_animations()
	match state:
		IDLE:
			pass
		NEW_DIRECTION:
					if rightWallCheck.is_colliding():
						direction = choose([up, down, left])
						state = choose([IDLE, MOVE])
					elif leftWallCheck.is_colliding():
						direction = choose([up, down, right])
						state = choose([IDLE, MOVE])
					elif upWallCheck.is_colliding():
						direction = choose([left, down, right])
						state = choose([IDLE, MOVE])
					elif downWallCheck.is_colliding():
						direction = choose([up, left, right])
						state = choose([IDLE, MOVE])
					else:
						direction = choose([up, down, left, right])
						state = choose([IDLE, MOVE])
		MOVE:
			move(delta)



func move(delta):
	velocity = direction * MOVE_SPEED * delta
	velocity = move_and_slide(velocity)


func choose(array):
	array.shuffle()
	return array.front()


func _on_Timer_timeout() -> void:
	$Timer.wait_time = choose([0.8, 1.4, 2.0])
	state = choose([IDLE, NEW_DIRECTION])

func update_animations():
	if direction == down and state == MOVE:
		animationPlayer.play("Down")
	elif direction == up and state == MOVE:
		animationPlayer.play("Up")
	elif direction == left and state == MOVE:
		animationPlayer.play("LeftRight")
		sprite.flip_h = true
	elif direction == right and state == MOVE:
		animationPlayer.play("LeftRight")
		sprite.flip_h = false
	elif state == IDLE:
		animationPlayer.play("Idle")
