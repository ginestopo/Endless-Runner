extends Node2D

export (PackedScene) var immolatorScene

func spawn():
	var immolator = immolatorScene.instance() as Node2D
	get_tree().get_root().add_child(immolator)
	immolator.global_position = self.global_position


func _on_Timer_timeout():
	if randi()%2 >= 1:
		spawn()
