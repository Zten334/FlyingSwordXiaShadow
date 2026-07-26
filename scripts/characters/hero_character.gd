extends CharacterBase
class_name HeroCharacter

@export_category("AnimationData")
@export var animation_base : AnimatorBase

@export_category("ComponentData")
@export var combat_component : CombatComponent
@export var ability_component : HeroAbilityComponent

#region AnimaitionEventReaction
func trigger_response(tag:Global.GameTag):
	match tag:
		Global.GameTag.EVENT_ATTACK:
			combat_component.attack_check()

#endregion

#region AdvancedLocomotion


#endregion


func _ready() -> void:
	#把动画状态机里面的触发事件连接到响应函数上面
	animation_base.trigger_event.connect(trigger_response)

func _process(delta: float) -> void:
	super(delta)
	
func _physics_process(delta: float) -> void:
	super(delta)

func is_hit() -> void:
	pass
	ability_component.try_activate_ability(Global.GameTag.ABILITY_HURT)
