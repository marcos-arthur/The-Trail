extends CanvasLayer
class_name HUDInteraction

@export var text: String = "Interagir"
@export var key: String = "E"

@onready var icon: TextureRect = get_node("Control/PanelContainer/MarginContainer/HBoxContainer/TextureRect")
@onready var label: Label = get_node("Control/PanelContainer/MarginContainer/HBoxContainer/Label")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):	
	label.set_text(text)
	if(key == "E"):
		icon.set_texture(load("res://assets/sprites/Icons/KeyE.png"))
	elif(key == "Sprint"):
		pass
