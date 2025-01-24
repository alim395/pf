extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HUD/HealthBar.max_value = $Player.maxhealthPoints
	$HUD/MagicBar.max_value = $Player.maxmagicPoints
	set_health_bar()
	set_magic_bar()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Reset"):
		get_tree().reload_current_scene()

func set_health_bar() -> void:
	$HUD/HealthBar.value = $Player.currhealthPoints

func set_magic_bar() -> void:
	$HUD/MagicBar.value = $Player.currmagicPoints

func _on_player_magic_shoot() -> void:
	set_magic_bar()

func _on_player_player_damaged() -> void:
	set_health_bar()
