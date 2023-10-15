extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	
	if($flesh_monster.released):
		print("A1")
		var speed: float = 75 # put wanted speed here
		velocity.x = -speed

	move_and_slide()
