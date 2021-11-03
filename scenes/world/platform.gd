extends StaticBody2D


export(int, -1000, 0) var speed := 200


func _physics_process(delta: float) -> void:
	position.x -= speed * delta


func _on_visibility_notifier_2d_screen_exited() -> void:
	queue_free()
