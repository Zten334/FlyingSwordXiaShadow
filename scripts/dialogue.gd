extends Control


@export var dialogue_button : Button
@export var dialogue_list : Array[String]


var index : int = 0
func _ready() -> void:
	dialogue_button.pressed.connect(next_dialogue)
	dialogue_button.text = dialogue_list[index]





func next_dialogue() -> void:
	index += 1
	if index < len(dialogue_list):
		dialogue_button.text = dialogue_list[index]
	else : index = 0
