extends CharacterBody2D

var speed : int = 2500
const JUMP_VELOCITY = -500.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var Fire : GPUParticles2D;

func _ready():
	Fire = get_child(0)

func _physics_process(delta):
	if Input.is_action_pressed("boost_up"):
		speed = 5000
	else: speed = 2500
	
	# Handle Jump.
	if Input.is_action_pressed("ui_accept"):
		Fire.set_emitting(true);
		if velocity.y < JUMP_VELOCITY:
			velocity.y = JUMP_VELOCITY
		else:
			velocity.y -= speed * delta
	else :
		Fire.set_emitting(false);
		if not is_on_floor():
			if velocity.y < 250:
				velocity.y += gravity * 2 * delta
			else:
				velocity.y += gravity * delta
		else: velocity.y = 0


	move_and_slide()
