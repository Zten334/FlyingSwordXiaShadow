extends AnimationTree
class_name AnimatorBase


@export_category("Sprite")
@export var sprite : Sprite3D 
@export_category("Owning_Character")
@export var character : CharacterBase

#region SignalsHook
#传的是事件的类型
signal trigger_event(int)

signal dir_event(int,Vector3)

func envoke_trigger_event(tag : StringName,vector:Vector3 = Vector3.ZERO) -> void:
	if vector == Vector3.ZERO:
		trigger_event.emit(Global.TagStringDic[tag])
	else:
		dir_event.emit(tag,vector)

#endregion

#region LocomotionUpdate
var velocity : Vector3
var has_velocity : bool

func update_locomotion_data() -> void:
	velocity = character.velocity
	has_velocity = (velocity != Vector3.ZERO)

#endregion

#region AbilityAnimation
@onready var playback_sm :AnimationNodeStateMachinePlayback = self.get("parameters/playback")

func _play_montage(name : String):
	if not playback_sm :
		return
	playback_sm.start(&"Ability")
	self["parameters/Ability/Transition/transition_request"] = name

func is_right() -> bool:
	return sprite.scale.x > 0

#endregion

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	#简单的根据方向进行翻转
	update_locomotion_data()
	
	if velocity.x > 0:
		sprite.scale.x = 1
	elif velocity.x < 0:
		sprite.scale.x = -1
