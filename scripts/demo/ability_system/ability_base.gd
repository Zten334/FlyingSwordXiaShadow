#ability为容器，实际数据掌控者为ability_data这个Resource
extends Node
class_name AbilityBase

@export var ability_data : AbilityData 
		


#基本信息：持有的角色、动画、以及自身的标签
var owner_character : CharacterBase
var owner_animator : AnimatorBase
#触发方式
var trigger_type

signal ability_diabled(int)

#func _init(ability_data : AbilityData,
		#owner_character : CharacterBase,
		#owner_animator : AnimatorBase) -> void:
			#
	#init(ability_data,owner_character,owner_animator)
	

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED

func _process(delta: float) -> void:
	pass
	
func _exit_tree() -> void:
	pass
	
#region AbilityStsem
#伪构造函数，用于将编辑器中添加的Ability进行初始化
func init(
		character : CharacterBase,
		animator : AnimatorBase) -> void:
	owner_character = character
	owner_animator = animator

func _enable_ability() -> void:
	process_mode = Node.PROCESS_MODE_INHERIT
	#具体逻辑

func _disable_ability() -> void:
	ability_diabled.emit(ability_data.ability_tag)
	process_mode = Node.PROCESS_MODE_DISABLED
	#具体逻辑

#endregion
