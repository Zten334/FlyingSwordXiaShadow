extends Label3D
class_name Dialogue3D


@export var dialogue_fragment : String
@export var type_interval : float


var current_index : int = 0

var time : float = 0

func _ready() -> void:
	visible = false
	
	display_dialogue(dialogue_fragment)

func _process(delta: float) -> void:
	var length = dialogue_fragment.length()
	if current_index >= length:
		return
		
	time += delta
	if time >= type_interval:
		type_word()
		time = 0


func display_dialogue(dialogue : String) -> void:
	current_index = 0
	dialogue_fragment = dialogue
	visible = true

#每次计时器事件触发时，增加字长
func type_word() -> void:
	print(1)
	current_index += 1
	text = dialogue_fragment.substr(0,current_index)

func switch_visiable() -> void:
	visible = !visible
