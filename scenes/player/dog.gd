extends KinematicBody2D


export (int) var _speed := 300
export (int) var _gravity := 800
export (int) var _jump_force := -400
export (AudioStreamSample) var _audio_clips

var jumps = 2

var velocity = Vector2()


func _physics_process(delta: float) -> void:
	var input := Input.get_action_strength("right") - Input.get_action_strength("left")
	velocity.x = input * _speed
	velocity.y += _gravity * delta
	if $RayCast2D.is_colliding() and Input.is_action_just_pressed("up") and jumps == 2:
		jumps = 1
		$jumpAudioStream.play()
		velocity.y = _jump_force
	elif Input.is_action_just_pressed("up") and jumps == 1:
		jumps = 0
		$jumpAudioStream.play()
		velocity.y = _jump_force*0.75
	elif !$RayCast2D.is_colliding() and Input.is_action_just_pressed("up") and jumps == 2:
		jumps = 0
		$jumpAudioStream.play()
		velocity.y = _jump_force*0.75
		
	velocity = move_and_slide(velocity)
	
	if not $RayCast2D.is_colliding():
		if( velocity.y < 0 ):
			#$AnimationPlayer.play("jump")
			$AnimationPlayer2.set_speed_scale(1.0)
			$AnimationPlayer2.play("jump")
		else:
			#$AnimationPlayer.play("fall")
			$AnimationPlayer2.set_speed_scale(1.0)
			$AnimationPlayer2.play("fall")
	elif input == 0:
		jumps = 2
		$AnimationPlayer2.play("run")
		$AnimationPlayer2.set_speed_scale(1.0)
		#$AnimationPlayer.play("walk")
	else:
		jumps = 2
		$AnimationPlayer2.play("run")
		$AnimationPlayer2.set_speed_scale(1.5)
		#$AnimationPlayer.play("run")
	
	if not input == 0:
		#$Sprite.flip_h = input < 0
		$Sprite2.flip_h = input < 0

func onHit():
	#So here we decrease health points and play damage audio, implement later on
	$onHitAudioStream.play()
