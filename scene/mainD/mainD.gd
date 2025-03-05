extends Node2D

var dialogueDone = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HUD/HealthBar.max_value = $Player.maxhealthPoints
	$HUD/HealthText.text = str($Player.maxhealthPoints)
	$HUD/MagicBar.max_value = $Player.maxmagicPoints
	set_health_bar()
	set_magic_bar()
	Dialogic.signal_event.connect(_on_dialogic_signal)
	dialogueDone = false

func _on_dialogic_signal(argument:String):
	if argument == "DialogueBegins":
		print("Dialogue is Beginning!")
		Global.DialogueOn = true
	if argument == "DialogueEnds":
		print("Dialogue is Beginning!")
		Global.DialogueOn = false

func _process(delta: float) -> void:
	if Global.DialogueOn == false:
		# Debug Functions
		if Input.is_action_just_pressed("Reset"):
			get_tree().reload_current_scene()
		if Input.is_action_just_pressed("DebugDamage"):
			$Player.currhealthPoints -= 1
			print($Player.currhealthPoints)
			set_health_bar()
		if Input.is_action_just_pressed("DebugHeal"):
			$Player.currhealthPoints += 1
			print($Player.currhealthPoints)
			set_health_bar()
		if Input.is_action_just_pressed("DebugMagic"):
			var magicHeal = 20 - $Player.currmagicPoints
			$Player.currmagicPoints += magicHeal
			print($Player.currmagicPoints)
			set_magic_bar()
	if Input.is_action_just_pressed("DebugExit"):
		Global.DialogueOn = false
		Dialogic.end_timeline()
		get_tree().change_scene_to_file("res://scene/menus/main_menu/main_menu.tscn")

func _input(event: InputEvent):
	# check if a dialog is already running
	if Dialogic.current_timeline != null:
		return
	if event is InputEventKey and event.keycode == KEY_ENTER and event.pressed and !dialogueDone:
		Dialogic.start("res://dialogues/testTimeline.dtl")
		get_viewport().set_input_as_handled()
		dialogueDone = true

func set_health_bar() -> void:
	$HUD/HealthBar.value = $Player.currhealthPoints
	$HUD/HealthText.text = str($Player.currhealthPoints)

func set_magic_bar() -> void:
	$HUD/MagicBar.value = $Player.currmagicPoints

func _on_player_magic_shoot() -> void:
	set_magic_bar()

func _on_player_player_damaged() -> void:
	set_health_bar()
