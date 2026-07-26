extends MontageAbility
class_name DashAbility

@export_category("LocomotionData")
@export var max_speed : float

var current_dir : Vector3
var speed : float

func _ready() -> void:
	super()
func _process(delta: float) -> void:
	super(delta)
	#print(owner_character.collision_layer)
	#print(owner_character.state_tag)
	owner_character.velocity = current_dir * speed

func _enable_ability() -> void:
	super()
	
	record_dir()
	
	owner_character.set_collision_layer_value(1,false)
	owner_character.set_collision_mask_value(1,false)
	
	#little move
	var tween = create_tween()
	tween.tween_method(update_speed,max_speed,0,0.3).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	
	owner_character.state_tag = Global.GameTag.STATE_DASH
	
func _disable_ability() -> void:
	super()
	owner_character.set_collision_layer_value(1,true)
	owner_character.set_collision_mask_value(1,true)
	owner_character.state_tag = Global.GameTag.STATE_LOCOMOTION

func record_dir() -> void:
	if owner_animator.is_right():
		current_dir = Vector3.RIGHT
	else:
		current_dir = -Vector3.RIGHT
	
func update_speed(value : float) -> void:
	speed = value
