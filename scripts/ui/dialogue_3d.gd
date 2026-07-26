extends MeshInstance3D
class_name Dialogue3D


@export var dialogue_fragment : String
@export var type_interval : float


@onready var timer : Timer = $Timer
@onready var label : Label3D  = $Label3D

var current_index : int = 0

var test : int 

func _ready() -> void:
	visible = false
	display_dialogue("你可知道我为了今日花费多少精力，难不成就凭你这一张嘴，便将饶了去？")

func display_dialogue(dialogue : String) -> void:
	current_index = 0
	dialogue_fragment = dialogue
	visible = true
	
	timer.wait_time = type_interval
	timer.start()

#每次计时器事件触发时，增加字长
func type_word() -> void:
	var length = dialogue_fragment.length()

	current_index = clamp(current_index,0,length)
	current_index += 1
	
	label.text = dialogue_fragment.substr(0,current_index)

	if current_index >= length:
		timer.paused = true


func switch_visiable() -> void:
	visible = !visible
	
	
