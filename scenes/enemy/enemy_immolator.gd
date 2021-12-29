extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var targetPlayerPosition
var playerCurrentPosition
export (int) var speed = 50
export (int) var steer_force = 75
var velocity = Vector2.ZERO
var accel = Vector2.ZERO
export (int) var health = 3
export (PackedScene) var deathParticles

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = Vector2(-100,20) #since player is not detected on immolator spawn, move it
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if playerCurrentPosition && is_instance_valid(playerCurrentPosition):
		accel = seek_player()
	velocity += accel * delta
	velocity = velocity.clamped(speed)
	rotation = clamp(velocity.x/steer_force,-PI/4,PI/4)
	#print(rotation+velocity.x)
	var collide = move_and_collide(velocity*delta)
	#For now just destroy, implement a selfDestruction function to call different particles
	#And also to take life from the player
	if collide && collide.get_collider().name == "Dog":
		health = 1
		onHit()
		$Timer.start()
	elif collide && !collide.get_collider().is_in_group("enemy"): #This one is for terrain collision, self destruct if it touches a tile
		health = 1
		onHit()
		$Timer.start()
	$Sprite.flip_h = velocity.x>0
		
	
func seek_player():
	var steer = Vector2.ZERO
	var desiredPosition= (playerCurrentPosition.global_position - global_position).normalized() * speed
	steer = (desiredPosition - velocity).normalized() * steer_force
	return steer


func onHit():
	var rng = RandomNumberGenerator.new()
	$onHitAudioStream.play()
	$onHitAudioStream.set_pitch_scale(rng.randf_range(1.0,1.8)*0.5)
	health-=1
	if health <= 0:
		get_node("/root/World").addScore(2)
		$hoveringAudioStream.stop()
		$CollisionShape2D.disabled = true
		$Sprite.visible = false
		$destroyedAudioStream.play()
		var particles = deathParticles.instance()
		add_child(particles)
		particles.emitting = true
		$Timer.start()

func destroy():
	queue_free()

func _on_Timer_timeout():
	destroy()
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if body.name == "Dog":
		playerCurrentPosition = body
	pass # Replace with function body.
