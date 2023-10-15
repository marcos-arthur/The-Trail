extends Node2D
class_name CarolController

@export var carol_sprite_controller: Sprite2D
@export var hanged_carol_sprite: Texture2D

var is_hanged: bool = false

func hang() -> void:
	carol_sprite_controller.set_texture(hanged_carol_sprite)
	carol_sprite_controller.set_offset(Vector2(0, -18))
	is_hanged = true

func _on_visible_on_screen_notifier_2d_screen_exited():
	if(is_hanged):
		carol_sprite_controller.queue_free()
