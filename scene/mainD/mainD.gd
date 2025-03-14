extends Node2D

var target_health: float
var current_health: float
var smoothness: float = 6.0  # Speed of interpolation (higher = faster)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Player/HUD/HealthBar.max_value = $Player.maxhealthPoints
	$Player/HUD/MagicBar.max_value = $Player.maxmagicPoints
	target_health = $Player.currhealthPoints  # Initialize target health
	current_health = target_health
	set_health_bar()
	set_magic_bar()
	Dialogic.signal_event.connect(_on_dialogic_signal)

func _on_dialogic_signal(argument:String):
	if argument == "DialogueBegins":
		print("Dialogue started!")
		Global.DialogueOn = true
	if argument == "DialogueEnds":
		print("Dialogue ended!")
		Global.DialogueOn = false

func _process(delta: float) -> void:
	if Global.DialogueOn == false:
		# Debug controls
		if Input.is_action_just_pressed("Reset"):
			get_tree().reload_current_scene()
		if Input.is_action_just_pressed("DebugDamage"):
			$Player.currhealthPoints -= 2
			target_health = $Player.currhealthPoints  # Update target for smooth animation
			print($Player.currhealthPoints)
		if Input.is_action_just_pressed("DebugHeal"):
			$Player.currhealthPoints += 2
			target_health = $Player.currhealthPoints  # Update target for smooth animation
			print($Player.currhealthPoints)
		if Input.is_action_just_pressed("DebugMagic"):
			var magicHeal = 20 - $Player.currmagicPoints
			$Player.currmagicPoints += magicHeal
			print($Player.currmagicPoints)
			set_magic_bar()
	
	# Smooth health interpolation
	if current_health != target_health:
		current_health = move_toward(current_health, target_health, smoothness * delta)
		set_health_bar()

	if Input.is_action_just_pressed("DebugExit"):
		Global.DialogueOn = false
		Dialogic.end_timeline()
		get_tree().change_scene_to_file("res://scene/menus/main_menu/main_menu.tscn")

func _input(event: InputEvent):
	if Dialogic.current_timeline != null:
		return
	if event is InputEventKey and event.keycode == KEY_ENTER and event.pressed:
		Dialogic.start("res://dialogues/testTimeline.dtl")
		get_viewport().set_input_as_handled()

func set_health_bar() -> void:
	$Player/HUD/HealthBar.value = current_health  # Use interpolated value

func set_magic_bar() -> void:
	$Player/HUD/MagicBar.value = $Player.currmagicPoints

func _on_player_magic_shoot() -> void:
	set_magic_bar()

func _on_player_player_damaged() -> void:
	target_health = $Player.currhealthPoints  # Update target when player takes damage
