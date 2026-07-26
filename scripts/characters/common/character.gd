extends CharacterBody3D
class_name CharacterBase

@export_category("PhyscisParaData")
#越大下落得越快
@export var gravity_rate : float

@export_category("CharacterNormalData")
@export var max_speed : float
@export var jump_velocity : float


#State Tag
var state_tag : Global.GameTag = Global.GameTag.STATE_LOCOMOTION


func _process(delta: float) -> void:
	_check_gravity(delta)


func _physics_process(delta: float) -> void:
	#_check_move(delta)
	move_and_slide()
	pass

#应用重力
func _check_gravity(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta * gravity_rate
	
