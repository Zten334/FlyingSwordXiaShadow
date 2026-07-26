extends EditorScript
class_name AbilityInitToll

#@export var component : AbilityComponentBase

#@export var abilities_to_init : Array[AbilityBase]


#func tool_init_abilities():
	#pass
	#var temp = component.abilities_map.keys()
	#for tag in temp:
		#component.abilities_map[tag].init(component.abilities_dic[tag],
		#component.owner_character,
		#component.owner_animator)

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
