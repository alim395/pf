extends Resource

class_name InventoryItem

@export var name: String = ""
@export var texture: Texture2D
@export var stackable: bool
@export var stack_amount: int

# Constructor Function
func _init(p_name = "Unnamed", p_texture = load("res://scene/shop/shop_items/UnknownItem.svg"), p_stackable = false, p_stack_amount = 16):
	name = p_name
	texture = p_texture
	stackable = p_stackable
	stack_amount = p_stack_amount
