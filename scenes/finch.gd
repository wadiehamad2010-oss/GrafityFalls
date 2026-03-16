extends Area2D

@export var level_number: int = 1 # حدد رقم المرحلة في الـ Inspector


func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		# استدعاء دالة الفوز من الـ GameManager
		GameManager.complete_current_level(level_number)
	pass # Replace with function body.
