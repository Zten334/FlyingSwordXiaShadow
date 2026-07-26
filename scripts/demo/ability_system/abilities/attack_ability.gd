extends MontageAbility
class_name AttackAbility

@export_category("LocomotionData")
@export var max_speed : Array[float]

@export_category("ComboData")
@export var max_combo : int
@export var combo_montages : Array[String]
@export var montage_durations : Array[float]

@export var combo_internl : float
#region LocomotionData
var current_dir : Vector3
var speed : float
#endregion

#region ComboData
#下一次攻击时的combo记数
var combo_num = 0


#endregion
func _ready() -> void:
	super()
	
func _process(delta: float) -> void:
	timer += delta
	
	if timer > montage_durations[combo_num]:
		_disable_ability()
		
	owner_character.velocity = current_dir * speed
	

func _enable_ability() -> void:
	#print("enable_attack",Time.get_ticks_usec())
	print(combo_num)
	owner_character.state_tag = Global.GameTag.STATE_LIGHTATTACK
	#因为MontageAbility这个毒瘤这里，就加一句process_mode吧
	process_mode = Node.PROCESS_MODE_INHERIT
	
	#Animation
	owner_animator._play_montage(combo_montages[combo_num])
	
	if owner_animator.is_right():
		current_dir = Vector3.RIGHT
	else:
		current_dir = -Vector3.RIGHT
	#创建动画路径
	
	#Locomotion
	var tween = create_tween()
	tween.tween_method(update_speed,max_speed[combo_num],0,0.3).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	
	
func _disable_ability() -> void:
	#print("disable_attack",Time.get_ticks_usec())
	#统一回收所有能力内部的变量和创建的timer
	timer = 0
	#结束时，进行一次攻击记数
	combo_num += 1
	if combo_num > max_combo:
		combo_num = 0
	#触发信号
	super()
	
	var temp_time = get_tree().create_timer(combo_internl)
	temp_time.connect(&"timeout",func() : if process_mode == PROCESS_MODE_DISABLED: combo_num = 0)
	
	owner_character.state_tag = Global.GameTag.STATE_LOCOMOTION

func update_speed(value : float) -> void:
	speed = value

func enter_recovery() -> void:
	#进入后摇状态
	if process_mode == PROCESS_MODE_DISABLED:
		return

	#这里我一直没弄懂为什么有时候Attack会因为处于RECOVERY状态而导致多次攻击
	owner_character.state_tag = Global.GameTag.STATE_RECOVERY
