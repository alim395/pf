extends Panel


@export_multiline var item_info_text: String

@onready var item_visual: Sprite2D = $CenterContainer/Panel/item_display
@onready var amount_text: Label = $CenterContainer/Panel/Label
@onready var item_info: PanelContainer = $TextureRect/PanelContainer
@onready var item_info_label: Label =$TextureRect/PanelContainer/MarginContainer/Label

func _ready() -> void:
	item_info.visible = false
	item_info_label.text = item_info_text
	
func update(slot: InventorySlot):
	if !slot.item:
		item_visual.visible = false
		amount_text.visible = false
	else:
		item_visual.visible = true
		item_visual.texture = slot.item.texture
		if slot.amount > 1:
			amount_text.visible = true
		amount_text.text = str(slot.amount)


func _on_texture_rect_mouse_entered() -> void:
	item_info.visible = true


func _on_texture_rect_mouse_exited() -> void:
	item_info.visible = false


func _on_button_pressed() -> void:
	pass
	#should continue the item drop
	#item_visual.visible = false
	#amount_text.visible = false
