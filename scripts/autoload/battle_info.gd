extends Node
class_name  Battle_Info





#region 基本信息：包括状态枚举，战场中的角色列表
enum Battle_States{TURN_START,SELECT,EXCUTE,END}

#战场中的角色列表
@export var battle_characters : Array[Battle_Character]

var current_token : int = 0

var battle_phase : Battle_States = Battle_States.TURN_START

#endregion


#
func advance_token() -> void:
	pass

func set_state(new_phase : Battle_States) -> void:
	battle_phase = new_phase
