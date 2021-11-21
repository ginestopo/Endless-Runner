extends KinematicBody2D

var speed = 1000;
var direction = Vector2.ZERO;
export (PackedScene) var hitParticles;

# Called when the node enters the scene tree for the first time.
func _ready():
	$killBullet.start()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	var collisionDetection = move_and_collide(direction*speed*_delta);
	if collisionDetection != null:
		if collisionDetection.get_collider().is_in_group("enemy"):
			var col = collisionDetection.get_collider()
			col.onHit()
			particleCreate(-direction)
			queue_free()
		elif collisionDetection.get_collider().is_in_group("player"):
			pass
		else:
			var col = collisionDetection.get_collider()
			particleCreate(-direction)
			queue_free()

func particleCreate(normalOfHit: Vector2) -> void:
	var particle = hitParticles.instance() as CPUParticles2D
	get_tree().get_root().add_child(particle)
	particle.global_position = self.global_position
	particle.rotation = normalOfHit.angle()
	particle.emitting = true


func killBullet(): #Called when timer runs out, so bullets won't travel infinitely
	queue_free()

