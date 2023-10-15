extends Control
class_name InteractionBubble

@export var text: String = "Interagir"
@export var key: String = "E"

@onready var icon: TextureRect = get_node("PanelContainer/MarginContainer/HBoxContainer/TextureRect")
@onready var label: Label = get_node("PanelContainer/MarginContainer/HBoxContainer/Label")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	label.set_text(text)
	if(key == "E"):
		icon.set_texture(load("res://assets/sprites/Icons/KeyE.png"))
	elif(key == "Sprint"):
		pass
