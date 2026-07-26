#用于存储Ability与其Tag之间的对应关系
extends Resource
class_name AbilityMapping


@export var ability_dic : Dictionary[Global.GameTag,AbilityData]
