extends Control

var currPlayerMoney = 0

# UI References
@export var ItemName : RichTextLabel
@export var ItemType : RichTextLabel
@export var ItemDesc : RichTextLabel
@export var PlayerMoney: RichTextLabel

func _ready() -> void:
	currPlayerMoney = Global.PlayerMoney
	PlayerMoney.text = str(currPlayerMoney) + " ₽"
