extends Node2D


var _Platform := preload("res://scenes/world/platform.tscn")

var _start_time := OS.get_ticks_msec()

var rng = RandomNumberGenerator.new()
export (int) var velocity 

var final_score 



func addScore(enemyType: int):
	if enemyType == 1:
		#print("Tarantula Died")
		$UI/Score.text = str(int($UI/Score.text)+1)
	elif enemyType == 2:	
		#print("Immolator Died")
		$UI/Score.text = str(int($UI/Score.text)+5)
	elif enemyType == 3:
		#print("Flyer Died")
		$UI/Score.text = str(int($UI/Score.text)+2)
		
		
func _on_death_barrier_body_entered(body: Node) -> void:
	if body.name == "Dog":
		$soundtrack.stop()
		$failedStreamPlayer.play()
		body.queue_free()
		final_score = $UI/Score.text
		$UI/Restart.show()
		$UI/Score.visible = false
		
		
		
		set_process(false)


func _on_platform_timer_timeout() -> void:
	var p := _Platform.instance()
	$Platforms.add_child(p)
	rng.randomize()
	p.position.x = 720
	p.position.y = randi() % 135 + 68



func _on_FreeEnemies_body_entered(body: Node) -> void:
	if body.is_in_group("enemy"):
			body.destroy()
	pass # Replace with function body.



func _on_Restart_pressed():
	get_tree().reload_current_scene()
	$UI/Score.visible = true


func _on_scoreTimer_timeout():
	$UI/Score.text = str((float($UI/Score.text)+1))
