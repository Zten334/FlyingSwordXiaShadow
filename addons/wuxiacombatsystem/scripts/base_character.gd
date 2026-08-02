extends CharacterBody3D

#region BASIC_DATA
@export_category("PhyscisParaData")
#越大下落得越快
@export var gravity_rate : float
@export_category("CharacterNormalData")
@export var max_speed : float
@export var acceleration : float
@export var jump_velocity : float


var stay_air : bool = false
#endregion

#region COMPONENTS
@onready var animation_tree = $AnimationTree
@onready var sprite3d = $CharacterSprite

#endregion


func _process(delta: float) -> void:
	print(velocity)
	_check_gravity(delta)
	_update_sprite_forwad()


func _physics_process(delta: float) -> void:
	_update_animator_data()
	move_and_slide()
	pass


#region ANIMATION
#调整Sprite的朝向
func _update_sprite_forwad() -> void:
	if !sprite3d:
		return
	#根据x方向的速率调整sprite的左右
	if velocity.x > 0 :
		sprite3d.scale.x = 1
	elif velocity.x < 0 :
		sprite3d.scale.x = -1
		
#更新AnimationTree中的运动相关数据
func _update_animator_data() -> void:
	if !animation_tree:
		return
	animation_tree.update_locomotion_data(velocity)


#endregion


#region LOCOMOTIONS
#应用重力
func _check_gravity(delta: float) -> void:
	if stay_air:
		return
	if not is_on_floor():
		velocity += get_gravity() * delta * gravity_rate




func jump() -> void:
	velocity.y = jump_velocity

##2D运动

#为当前角色施加加速度
#forward:前进的方向，0到1之间，Vector3
#delta：速度增量
func accelerate(forward,delta) -> void:
	var new_vel = forward.normalized() * max_speed	
	velocity.x = move_toward(velocity.x,new_vel.x,delta * acceleration)
	velocity.z = move_toward(velocity.z,new_vel.y,delta * acceleration)


#直接设置当前角色的速度
#forward:方向
#rate:与最大速率的比例
func assign_velocity(forward,rate = 1) -> void:
	velocity.x = forward.x * rate * max_speed
	velocity.z = forward.y * rate * max_speed
#endregion


#region CONBAT
func light_attack() -> void:
	pass
	
func hurt() -> void:
	pass




#endregion
