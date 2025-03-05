extends Node2D

var target_health: float
var current_health: float
var smoothness: float = 6.0  

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Player/HUD/HealthBar.max_value = $Player.maxhealthPoints
	$Player/HUD/MagicBar.max_value = $Player.maxmagicPoints
	target_health = $Player.currhealthPoints
	current_health = target_health
	set_health_bar()
	set_magic_bar()

func _process(delta: float) -> void:
	# Debug Functions
	if Input.is_action_just_pressed("Reset"):
		get_tree().reload_current_scene()
	if Input.is_action_just_pressed("DebugDamage"):
		$Player.currhealthPoints -= 2
		print("Player Health: ", $Player.currhealthPoints)
		target_health = $Player.currhealthPoints
	if Input.is_action_just_pressed("DebugHeal"):
		$Player.currhealthPoints += 2
		print("Player Health: ", $Player.currhealthPoints)
		target_health = $Player.currhealthPoints
	if Input.is_action_just_pressed("DebugMagic"):
		var magicHeal = 20 - $Player.currmagicPoints
		$Player.currmagicPoints += magicHeal
		print("Player Magic: ", $Player.currmagicPoints)
		set_magic_bar()
	if Input.is_action_just_pressed("DebugExit"):
		get_tree().change_scene_to_file("res://scene/menus/main_menu/main_menu.tscn")
	

	if current_health != target_health:
		current_health = move_toward(current_health, target_health, smoothness * delta)
		print("Current Health: ", current_health)  
		set_health_bar()

func set_health_bar() -> void:
	$Player/HUD/HealthBar.value = current_health  

func set_magic_bar() -> void:
	$Player/HUD/MagicBar.value = $Player.currmagicPoints

func _on_player_magic_shoot() -> void:
	set_magic_bar()

func _on_player_player_damaged() -> void:
	target_health = $Player.currhealthPoints
