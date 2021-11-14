extends Node2D

export var bulletScene : PackedScene

signal shot

func _input(event):
	if event.is_action_pressed("shoot"):
		var bullet = bulletScene.instance() as Node2D
		get_tree().get_root().add_child(bullet)
		bullet.global_position = self.global_position
		bullet.direction = (get_global_mouse_position()-global_position).normalized()
		bullet.rotation = bullet.direction.angle()
		
		emit_signal("shot") #used for the camera to know when to shake
