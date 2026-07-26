extends AbilityComponentBase
class_name HeroAbilityComponent

@export_category("InputMappingData")
@export var input_tag_map : Dictionary[StringName,Global.GameTag]


func _ready() -> void:
	super()
	for input_name in input_tag_map.keys():
		InputSystem._bind_action(input_name,enable_ability_by_input)

func _process(delta: float) -> void:
	#print(active_abilities)
	pass


func enable_ability_by_input(inputname : StringName):
	try_activate_ability(input_tag_map[inputname])
	
