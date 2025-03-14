extends Control

# Back Button
func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/menus/main_menu/main_menu.tscn")

# Fullscreen Button
func _on_fs_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
