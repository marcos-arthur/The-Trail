extends CharacterBody2D
class_name NPCRyan

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
