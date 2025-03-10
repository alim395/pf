extends Resource

class_name ShopItem

# DEFAULT
var DEFAULT_TEXTURE = load("res://scene/shop/shop_items/UnknownItem.svg")

# InventoryItem variables
@export var name: String = ""
@export var texture: Texture2D
@export var stackable: bool
@export var stack_amount: int

# ShopItem variables
enum {INSTANT,CONSUMABLE,WEAPON}

@export var price: int
@export var itemType: int

# Constructor Function
func _init(p_name = "Unnamed", p_texture = DEFAULT_TEXTURE, p_stackable = false, p_stack_amount = 16, p_price = 1, p_itemType = INSTANT):
	name = p_name
	texture = p_texture
	stackable = p_stackable
	stack_amount = p_stack_amount
	price = p_price
	itemType = p_itemType

# Item Conversion
func ShopToInv(p_texture = DEFAULT_TEXTURE):
	var InvItem = InventoryItem.new(self.name,p_texture,self.stackable,self.stack_amount)
	return InvItem
