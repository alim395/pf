extends Node2D

var currPlayerMoney = 0
var currPlayerInventory = Global.PlayerInventory

func _ready() -> void:
	currPlayerMoney = Global.PlayerMoney

func buy_item(item:ShopItem):
	if currPlayerMoney >= item.price:
		currPlayerMoney -= item.price
		var invItem = item.ShopToInv()
		currPlayerInventory.insert(invItem)
	else:
		print("Not enough Rubles.")
