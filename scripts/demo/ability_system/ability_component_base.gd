extends Node
class_name AbilityComponentBase

@export_category("OwnerCharacterInfo")
@export var owner_character : CharacterBase
@export var owner_animator : AnimatorBase

#map是一定要保留的，但是后续AbilityData可能会考虑删除
@export_category("AbilitiesMap")
@export var abilities_map : Dictionary[Global.GameTag,AbilityBase] 

#这里存储当前有哪些能力正在激活
#这里存储的能力，都是触发型能力
var active_abilities : Dictionary[Global.GameTag,bool]

func _ready() -> void:
	var temp = abilities_map.keys()
	for tag in temp:
		abilities_map[tag].init(
		owner_character,
		owner_animator)
		#将能力关闭信号绑定到回调函数中
		abilities_map[tag].ability_diabled.connect(_ability_disable)
		#激活所有能力
		#这里需要把能力相关的输入加入到InputSystem中
	
func _process(delta: float) -> void:
	#遍历所有激活的能力
	for ability in active_abilities:
		pass
		

func give_ability(tag : Global.GameTag):
	pass

func try_activate_ability(tag : Global.GameTag):
	var ability_data = abilities_map[tag].ability_data
	#如果当前激活的能力中，有将该tag排除在外的，也无法进入
	for acting_tag in active_abilities:
		if ability_data.block_tags.has(tag):
			return
	#如果有前置被阻塞的能力，则不会被激活
	if (ability_data.activate_block_tags.has(owner_character.state_tag) 
	or 0):
		return 
	#这里的前置激活标签判定就先不做力
	#算了还是写一下罢
	for activate_tag in ability_data.activate_tags:
		if abilities_map[activate_tag].process_mode == ProcessMode.PROCESS_MODE_DISABLED:
			return
	#强制取消所有列出的能力
	for cancel_tag in ability_data.cancel_tags:
		if abilities_map.has(cancel_tag):
			abilities_map[cancel_tag]._disable_ability()
		active_abilities.erase(cancel_tag)
	
	#如果检测都通过了，就触发能力
	active_abilities[tag] = true
	#先设置一次，保证能够顺利进入
	abilities_map[tag]._enable_ability()
	
#一个能力自己被关闭时发出的回调
func _ability_disable(tag : Global.GameTag) -> void:
	active_abilities.erase(tag)
