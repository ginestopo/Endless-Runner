extends KinematicBody2D


var velocity = Vector2()
export (int) var speed = 5
export (int) var gravity = 10


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
	#reduce health when implemented and call destroy
	destroy()

#func _on_VisibilityNotifier2D_screen_exited():
#	get_parent().queue_free()
#	pass # Replace with function body.
func destroy():
	get_parent().queue_free()
