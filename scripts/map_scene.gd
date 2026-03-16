extends Node2D

var last_clicked_button = -1

func _ready():
	# 1. تحميل البيانات من GameManager فور التشغيل
	last_clicked_button = GameManager.unlocked_levels
	update_map_visuals()

func update_map_visuals():
	# نمر على الأزرار من 1 إلى 10
	for i in range(1, 11):
		var button_path = "Button" + str(i)
		if has_node(button_path):
			var btn = get_node(button_path) as Button
			btn.disabled=(i>GameManager.unlocked_levels)
			# إظهار الباب الأبيض إذا المرحلة مكتملة
			var white_door = btn.get_node_or_null("FinishedSprite")
			if white_door:
				white_door.visible = (i in GameManager.completed_levels)
			
			# إظهار السهم فقط فوق الزر المختار حالياً
	



func enter_level(level_number: int):
	var level_path = "res://level" + str(level_number) + ".tscn"
	if ResourceLoader.exists(level_path):
		get_tree().change_scene_to_file(level_path)
func _on_level_button_pressed(level_number: int):
	# إذا ضغطت زر جديد، ننقل السهم ونبدأ التايمر
	if last_clicked_button != level_number:
		last_clicked_button = level_number
		update_map_visuals()
		enter_level(1)
func _on_button_1_pressed() -> void:
	_on_level_button_pressed(1)
	pass # Replace with function body.
func _on_button_2_pressed() -> void:
	_on_level_button_pressed(2)
	pass # Replace with function body.
func _on_button_3_pressed() -> void:
	_on_level_button_pressed(3)
	pass # Replace with function body.
func _on_button_4_pressed() -> void:
	_on_level_button_pressed(4)
	pass # Replace with function body.
