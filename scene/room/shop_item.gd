extends Control

class_name ShopItem

# DEFAULT
var DEFAULT_TEXTURE = load("res://scene/shop/shop_items/UnknownItem.svg")

# InventoryItem variables
@export var itemName: String = ""
@export var texture: Texture2D
@export var stackable: bool
@export var stack_amount: int

# ShopItem variables
enum {INSTANT,CONSUMABLE,WEAPON}

@export var price: int
@export var itemType: int
@export var itemDesc: String

# Constructor Function
func _init(p_name = "Unnamed", p_texture = DEFAULT_TEXTURE, p_stackable = false, p_stack_amount = 16, p_price = 1, p_itemType = INSTANT, p_itemDesc = "Unknown Descritpion."):
	itemName = p_name
	texture = p_texture
	stackable = p_stackable
	if(stackable):
		stack_amount = p_stack_amount
	else:
		stack_amount = 1
	price = p_price
	itemType = p_itemType
	itemDesc = p_itemDesc

# Item Conversion
func ShopToInv(p_texture = DEFAULT_TEXTURE):
	var InvItem = InventoryItem.new(self.itemName,p_texture,self.stackable,self.stack_amount)
	return InvItem
