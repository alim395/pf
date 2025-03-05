extends Control

func _on_level_0_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/main/main.tscn")

func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/mainD/mainD.tscn")

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/menus/main_menu/main_menu.tscn")
