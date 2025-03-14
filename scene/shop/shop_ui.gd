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
		item.focus_entered.connect(shopItemUpdate.bind(item.itemName,item.itemType, item.itemDesc))
		item.mouse_entered.connect(shopItemUpdate.bind(item.itemName,item.itemType, item.itemDesc))

func shopItemUpdate(iName, iType, iDesc):
	ItemName.text = iName
	ItemType.text = str(iType)
	ItemDesc.text = iDesc
