extends Node3D


@export var camera : Node3D

@onready var character : Node3D = $CharacterBody3D

var offset  : Vector3

func _ready() -> void:
	offset = camera.global_position - character.global_position 


func _process(delta: float) -> void:
	camera.global_position = character.global_position + offset
