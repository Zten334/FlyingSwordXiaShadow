extends Node3D
class_name CombatComponent

@export_category("AttackData")
@export var attack_area : Area3D
@export var target_faction : StringName

func _ready() -> void:
	pass


func attack_check() -> void:
	var hits =  attack_area.get_overlapping_bodies()
	for hit in hits:
		if hit.has_method("is_hit") and hit.is_in_group(target_faction):
			hit.is_hit()

func _process(delta: float) -> void:
	pass
