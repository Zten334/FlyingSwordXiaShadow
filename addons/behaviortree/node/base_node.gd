extends Node
class_name BaseBTNode

enum {
	SUCCESS,
	FAILED,
	RUNNING,
}

var root          	#节点的根结点
var actor			#控制的节点
var blackbord       #黑板类

var task_idx = 0	#当前执行的task的index

func _task() -> int:
	return SUCCESS
