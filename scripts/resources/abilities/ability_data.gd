extends Resource
class_name AbilityData



@export var ability_tag : Global.GameTag
#先遍历实现
@export_category("InteractionTagsInfo")
#存在上述标签其中之一的时候，无法启动该能力
@export var activate_block_tags : Array[Global.GameTag]
#必须同时激活上述能力，才能启动该能力
@export var activate_tags :Array[Global.GameTag]
#当激活该技能时，强制中断其他能力
@export var cancel_tags : Array[Global.GameTag]
#当该技能被激活时，阻止其他技能力进入
@export var block_tags : Array[Global.GameTag]
