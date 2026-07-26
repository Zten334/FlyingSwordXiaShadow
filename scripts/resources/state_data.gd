extends Resource
class_name State_Data

enum State_Type{BUFF,DEBUFF,STUN,}

@export var type : State_Type

#TODO 固定值的加成需要做吗？还是只有百分比就够了
#若果要做的话，可以新开一个字典，这样的话还要计算优先级
#region BUFF、DEBUFF专属
enum Influence_Para{}

@export var para_degree : Dictionary[Influence_Para,float]

#endregion
	

#可以积攒的最高层数，默认为1，即无法积攒
@export var max_accumulation : int = 1
