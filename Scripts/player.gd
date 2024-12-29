extends CharacterBody2D

const SPEED = 80.0
const JUMP_VELOCITY = -400.0
var moving = false
var direction

func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * SPEED
	move_and_slide()
	update_animation()
	
func update_animation():
	if direction == Vector2.ZERO:
		$AnimatedSprite2D.play("idle_LR")
		return
	
	if direction == Vector2.RIGHT:
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("walk_LR")
	elif direction == Vector2.LEFT:
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("walk_LR")
	elif direction == Vector2.UP:
		$AnimatedSprite2D.play("walk_up")
	elif direction == Vector2.DOWN:
		$AnimatedSprite2D.play("walk_down")
		
	
