extends Node

# المتغيرات الأساسية
var unlocked_levels = 1
var completed_levels = [1]
const SAVE_PATH = "user://savegame.save" # مسار الحفظ على جهاز المستخدم

func _ready():
	# تحميل البيانات فور تشغيل اللعبة
	load_game()

# دالة تُستدعى عند الفوز في المرحلة
func complete_current_level(level_num: int):
	# 1. إضافة المرحلة لقائمة المكتملة إذا لم تكن موجودة
	if not level_num in completed_levels:
		completed_levels.append(level_num)
	
	# 2. فتح المرحلة التالية إذا كانت هي المرحلة الجديدة
	if level_num == unlocked_levels:
		unlocked_levels += 1
	
	# 3. حفظ التقدم فوراً
	save_game()

# --- نظام الحفظ (Writing) ---
func save_game():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		var data = {
			"unlocked_levels": unlocked_levels,
			"completed_levels": completed_levels
		}
		file.store_var(data)
		file.close()
		print("تم حفظ اللعبة بنجاح!")

# --- نظام التحميل (Reading) ---
func load_game():
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		if file:
			var data = file.get_var()
			# استرجاع القيم وتحديث المتغيرات
			unlocked_levels = data.get("unlocked_levels", 1)
			completed_levels = data.get("completed_levels", [])
			file.close()
			print("تم تحميل التقدم السابق.")
	else:
		print("لا يوجد ملف حفظ سابق، البدء من الصفر.")

# دالة اختيارية إذا أردت مسح الحفظ (Reset)
func reset_game():
	unlocked_levels = 1
	completed_levels = []
	save_game()
	
