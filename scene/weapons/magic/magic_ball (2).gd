extends Area2D

@export var speed = 1300

func _ready():
	set_as_top_level(true)

func _process(delta: float):
	position += (Vector2.RIGHT * speed).rotated(rotation) * delta

func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()
