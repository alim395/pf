extends Control

var currPlayerMoney = 0

# UI References
@export var ItemName : RichTextLabel
@export var ItemType : RichTextLabel
@export var ItemDesc : RichTextLabel
@export var PlayerMoney: RichTextLabel
@export var ShopItemContainer: Container

func _ready() -> void:
	currPlayerMoney = Global.PlayerMoney
	PlayerMoney.text = str(currPlayerMoney) + " ₽"
	var shopItems: Array = ShopItemContainer.get_children()
	for item in shopItems:
		item.focus_entered.connect(shopItemUpdate.bind(item.itemName,item.itemType, item.itemDesc, item.price))
		item.mouse_entered.connect(shopItemUpdate.bind(item.itemName,item.itemType, item.itemDesc, item.price))
		item.ShopItemBuy.connect(buy_item.bind(item))

func shopItemUpdate(iName, iType, iDesc, iPrice):
	ItemName.text = iName
	match iType:
		0:
			ItemType.text = "Instant Use" + "| ₽" + str(iPrice)
		1:
			ItemType.text = "Consumable" + "| ₽" + str(iPrice)
		2:
			ItemType.text = "Weapon" + "| ₽" + str(iPrice)
		_:
			ItemType.text = str(iType) + "| ₽" + str(iPrice)
	ItemDesc.text = iDesc

func buy_item(item:ShopItem):
	if currPlayerMoney >= item.price:
		currPlayerMoney -= item.price
		var invItem = item.ShopToInv()
		Global.PlayerInventory.insert(invItem)
		PlayerMoney.text = str(currPlayerMoney) + " ₽"
	else:
		print("Not enough Rubles.")
