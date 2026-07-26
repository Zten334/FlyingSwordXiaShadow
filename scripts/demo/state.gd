extends Node
class_name State

enum State_Type {IDLE,RUN,ATTACK,JUMP,SLASH}

@export_category("控制角色")
@export var character : CharacterBody3D

@export_category("状态参数")
@export var state_type : State_Type


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	_swith_state()

func _physics_process(delta: float) -> void:
	match state_type:
		State_Type.IDLE:
			_idle_phy_process(delta)
		State_Type.RUN:
			_run_phy_process(delta)
		State_Type.JUMP:
			_jump_phy_process(delta)


#region 逻辑函数

func _idle_phy_process(delta : float) -> void:
	pass
	
func _run_phy_process(delta : float) -> void:
	pass

func _jump_phy_process(delta : float) -> void:
	pass

func _swith_state() -> void:
	pass
	#判断输入、发送信号


#endregion
