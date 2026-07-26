extends CharacterBody3D
class_name Battle_Character

#TODO 增加角色职责
#temp
@export var character_data : Charcter_Data
@export var battle_info : Battle_Info
@export var battle_manager : Battle_Manager

#TODO 目前数值只有血量蓝量攻击防御，后续还有
#暴击率，闪避率，破甲等等
#region 基础数值
var max_hp : float 
var max_mp : float 
var base_atk : float 
var base_def : float 
#endregion

#region 实际数值
var hp : float 
var mp : float
var atk : float
var def : float
#endregion

#region 当前所拥有的的状态列表

var state_list : Array[Battle_State]
#endregion



#region 修改内部数据的方法，外部修改数据时，必须调用该逻辑
#减少所有状态的cd
func reduce_state_cd() -> void:
	for state in state_list:
		state.change_cd(-1)

#获得新的状态
func get_new_state(state:Battle_State,cd : int) -> void:
	var character = Battle_State.new()
	add_child(character)

func excute_skill() -> void:
	pass
	

#endregion




#region 通用方法
#TODO 这里的六维转化方式是简单的叠加，后续可以设置更复杂的转化
func init() -> void:
	max_hp = character_data.base_hp + character_data.bone_struc
	max_mp = character_data.base_mp + character_data.qi * 2
	base_atk = character_data.base_atk + character_data.strength
	base_def = character_data.base_def + character_data.toughness
	hp = max_hp
	mp = max_mp
	atk = base_atk
	def = base_def
	
	
#endregion
