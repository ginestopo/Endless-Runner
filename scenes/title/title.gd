extends Control


export(String, FILE, "*.tscn") var _start: String


func _on_button_pressed() -> void:
	get_tree().change_scene(_start)
