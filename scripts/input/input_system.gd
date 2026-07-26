extends Node


#绑定输入
#一个输入名称，一个Callable数组
var input_mapping : Dictionary[StringName,Array]


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	#遍历所有已注册的输入，进行事件分发
	#因为这里是callable，所以它并非直接执行的，不同的时刻执行情况不一样
	#每次call都只能传入那个时刻的变量，然后执行，鬼知道会顺延到什么地方去
	for action in input_mapping.keys():
		if Input.is_action_just_pressed(action):
			print(action)
			for callable in input_mapping[action]:
				callable.call(action)
	
		

#绑定后一定要记得在自身销毁的时候解除绑定！！
func _bind_action(name : StringName,call : Callable) -> void:
	if !input_mapping.has(name):
		input_mapping[name] = []
	input_mapping[name].append(call)

func _unbind_action(name : StringName,call : Callable) -> void:
	if !input_mapping.has(name):
		return
	#将数组中的回调函数抹除
	input_mapping[name].erase(call)
