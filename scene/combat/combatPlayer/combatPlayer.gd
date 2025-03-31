extends CharacterBody2D

# Signals
signal player_damaged
signal magic_shoot

@export_group("Vitality Properties")
@export var maxhealthPoints = 20
@export var maxmagicPoints = 20
@export var currhealthPoints = 20
@export var currmagicPoints = 20

@export_group("Movement Properties")
@export var max_speed = 380
@export var accel = 1500
@export var friction = 600

@export_group("WeaponMagic Properties")
@export var magic = preload("res://scene/weapons/magic/MagicBall.tscn")

@export_group("Inventory Properties")
@export var inventory: Inventory

var input = Vector2.ZERO
var magic_cooldown = true

func player_movement(input, delta):
	if input: 
		velocity = velocity.move_toward(input * max_speed, accel * delta)
	else: 
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)

func player_attack():
	# To be done
	pass

func _physics_process(delta: float):
	if Global.DialogueOn == false:
		input = Input.get_vector("Left", "Right", "Up", "Down")
		player_movement(input, delta)
		move_and_slide()
		# player_attack()

func damage_player(n: int):
	currhealthPoints = clamp(currhealthPoints - n, 0, maxhealthPoints)
	player_damaged.emit()

func heal_player(n: int):
	currhealthPoints = clamp(currhealthPoints + n, 0, maxhealthPoints)
	player_damaged.emit()

func collect(item):
	inventory.insert(item)
