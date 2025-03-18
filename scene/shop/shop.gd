extends Node2D

var currPlayerMoney = 0
var currPlayerInventory = Global.PlayerInventory

func _ready() -> void:
	currPlayerMoney = Global.PlayerMoney

func _process(_delta) -> void:
	if Input.is_action_just_pressed("DebugExit"):
		get_tree().change_scene_to_file("res://scene/menus/main_menu/main_menu.tscn")

func buy_item(item:ShopItem):
	if currPlayerMoney >= item.price:
		currPlayerMoney -= item.price
		var invItem = item.ShopToInv()
		currPlayerInventory.insert(invItem)
	else:
		print("Not enough Rubles.")


func _on_exit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/menus/main_menu/main_menu.tscn")
