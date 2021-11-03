extends KinematicBody2D


export (int) var _speed := 300
export (int) var _gravity := 800
export (int) var _jump_force := -400

var velocity = Vector2()


func _physics_process(delta: float) -> void:
	var input := Input.get_action_strength("right") - Input.get_action_strength("left")
	velocity.x = input * _speed
	velocity.y += _gravity * delta
	if $RayCast2D.is_colliding() and Input.is_action_just_pressed("up"):
		velocity.y = _jump_force
	velocity = move_and_slide(velocity)
	
	if not $RayCast2D.is_colliding():
		$AnimationPlayer.play("jump")
	elif input == 0:
		$AnimationPlayer.play("walk")
	else:
		$AnimationPlayer.play("run")
	
	if not input == 0:
		$Sprite.flip_h = input < 0
