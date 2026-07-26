extends Resource
class_name Dialogue_Fragment

#int表示不同的说话对象，使用枚举对觉得进行匹配
#例如：0代表玩家，1代表任务NPC，2代表敌人
@export var dialogues : Dictionary[int,String]

#在不同的对话节点处触发事件，例如选择
@export var message_points : Dictionary[int,int]
