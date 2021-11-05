extends Sprite


func _process(delta):
	var direction = get_global_mouse_position()-global_position+Vector2(0,12)
	scale.x = 1-(2*int(direction.x<-0.1))
	var angleTo = transform.x.angle_to(direction)
	rotation = clamp(rotation+angleTo,-PI/2,PI/2)
	pass
