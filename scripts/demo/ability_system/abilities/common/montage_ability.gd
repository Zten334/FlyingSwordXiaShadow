extends AbilityBase
class_name MontageAbility

@export_category("Animation_Info")
@export var montage_name : String
@export var animation_time : float

var timer : float = 0.0


func _ready() -> void:
	super()
	#InputSystem._bind_action("attack",_enable_ability)
	pass

func _enable_ability() -> void:
	super()
	owner_animator._play_montage(montage_name)

func _disable_ability() -> void:
	super()
	owner_character.state_tag = Global.GameTag.STATE_LOCOMOTION
	pass

func _process(delta: float) -> void:
	#先停止速度
	owner_character.velocity = Vector3.ZERO
	#
	timer += delta
	if timer > animation_time:
		timer = 0
		_disable_ability()
