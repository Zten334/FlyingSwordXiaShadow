extends Resource
class_name Charcter_Data


@export_category("Base_Para_1")
@export var bone_struc : float
@export var strength : float
@export var qi : float
@export var toughness: float

#TODO 后续需要加入的战斗属性
#命中、闪避、速度、暴击、防爆、反伤等等
@export_category("Base_Para_2")
@export var base_hp : float
@export var base_mp : float
@export var base_atk : float
@export var base_def: float

@export_category("Skill_List")
@export var skill_list : Dictionary[Skill_Data,int]
