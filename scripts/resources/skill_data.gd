extends Resource
class_name Skill_Data


@export_category("Base_Info")
@export var cost_mp : float
@export var demage_mul : float

@export_category("Add_State")
#分别为：添加的状态数据和持续的回合数
@export var state_added : Dictionary[State_Data,int]

#skill_level_data
