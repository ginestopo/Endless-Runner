extends KinematicBody2D


var velocity = Vector2()
export (int) var speed = 5
export (int) var gravity = 10
export (int) var health = 2
export (PackedScene) var deathParticles


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	velocity.y += gravity*delta
#	velocity.x = speed
#	if $RayCast2D.is_colliding():
#		velocity.y = 0
#
#	velocity = move_and_slide(velocity)
	pass

func onHit():
	var rng = RandomNumberGenerator.new()
	$onHitAudioStream.play()
	$onHitAudioStream.set_pitch_scale(rng.randf_range(1.0,1.8)*0.5)
	health-=1
	if health <= 0:
		get_node("/root/World").addScore(1)
		$CollisionShape2D.disabled = true
		$Sprite.visible = false
		$destroyedAudioStream.play()
		var particles = deathParticles.instance()
		add_child(particles)
		particles.emitting = true
		$Timer.start()
	#reduce health when implemented and call destroy
	

#func _on_VisibilityNotifier2D_screen_exited():
#	get_parent().queue_free()
#	pass # Replace with function body.
func destroy():
	get_parent().queue_free()


func _on_Timer_timeout():
	destroy()

