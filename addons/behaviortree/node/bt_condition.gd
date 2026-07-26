extends BaseBTNode
class_name BTCondition

func in_destination() -> bool:
	return true

var condition : Callable     #条件判断的函数

func _ready() -> void:
	condition = in_destination
