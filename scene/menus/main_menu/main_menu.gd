extends Control

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/main/main.tscn")

func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/menus/options_menu/options_menu.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
