extends CharacterBody2D


@onready var direcror: RayCast2D = $direcror
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
# هذ المتغير لازم يكون في كل حاجة حاب نبدل لها الجاذبية
var dir_g=1
var dir_m=1
const  SPEED=300
func _physics_process(delta: float) -> void:
	# معلومات مهمة حول متغير انجاه الجاذبية والبحث عن حوله في الارض او السقف مع الجاذبية صحيحة
	var is_floor=is_grav(dir_g)
	# جاذبية 
	if not is_floor:
		velocity+=get_gravity()*delta*dir_g
	velocity.x=SPEED*dir_m
	move_and_slide()

func move(delta):
	if !direcror.is_colliding() or is_on_wall():
		dir_m*=-1
	pass
# البحث عن هل هو في الجاذبية الصحيحة لتصحيح التجاه
func is_grav(g):
	if is_on_floor() and g==1:
		return true
	elif is_on_ceiling() and g==-1:
		return true
	else:
		return false
