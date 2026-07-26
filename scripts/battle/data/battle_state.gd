extends Node
class_name Battle_State

#temp
@export var state_data : State_Data
#region 	 初始数据
var type : State_Data.State_Type

#HACK 这里包含了一处隐性依赖，battle_state需要知道每个属性的编号
var para_degree : Dictionary[State_Data.Influence_Para,float]

var max_accumulation : int

var cd : int
#endregion


func _ready() -> void:
	#TODO 把所有的状态效果读取到运行时数据中来
	pass

func _process(_delta: float) -> void:
	#如果cd为0，自动释放自身
	if cd == 0:
		#TODO 如果是可叠层的话，应该怎么办
		queue_free()






#region 内部修改函数

func change_cd(value : int) -> void:
	cd += value

#TODO 叠层函数


#endregion
