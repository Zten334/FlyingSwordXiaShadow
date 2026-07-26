extends BaseBTNode
class_name BTSequence

var result = SUCCESS

func _task() -> int:
	var childNum = get_child_count()
	while task_idx < childNum:
		var childBTNode = get_child(task_idx)
		if not childBTNode is BaseBTNode:
			print(childBTNode.name,"is not BTNode")
			return FAILED
		result = childBTNode._task()
		
		if result == SUCCESS:
			task_idx += 1
		else:
			break
	
	task_idx = 0
	
	return result
