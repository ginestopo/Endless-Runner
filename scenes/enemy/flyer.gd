extends KinematicBody2D

export (int) var velocity = 1
var health = 1
export (PackedScene) var deathParticles

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("animation")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position.x -= velocity
	#print("position:",self.position.x,",",self.position.y)
	

func onHit():
	var rng = RandomNumberGenerator.new()
	$onHitAudioStream.play()
	$onHitAudioStream.set_pitch_scale(rng.randf_range(1.0,1.8)*0.5)
	health-=1
	if health <= 0:
		$hoveringAudioStream.stop()
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
	$hoveringAudioStream.stop()
	queue_free()


func _on_Timer_timeout():
	pass # Replace with function body.
