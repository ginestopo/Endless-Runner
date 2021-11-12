extends KinematicBody2D

var speed = 1000;
var direction = Vector2.ZERO;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	var collisionDetection = move_and_collide(direction*speed*_delta);
	if collisionDetection != null:
		queue_free()
#	pass
