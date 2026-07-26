extends AbilityBase
class_name MoveAbility

func _ready() -> void:
	super()
	#移动能力是默认开启的
	process_mode = Node.PROCESS_MODE_INHERIT
	
func _enable_ability() -> void:
	super()
	#print(ability_tag)
	
func _process(delta: float) -> void:
	#防御性，如果还没有实例化拥有角色，则不执行任何操作
	if !owner_character or owner_character.state_tag != Global.GameTag.STATE_LOCOMOTION:
		return
	check_move(delta)
	check_jump(delta)

func check_move(delta:float) -> void:
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (owner_character.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		owner_character.velocity.x = direction.x * owner_character.max_speed
		owner_character.velocity.z = direction.z * owner_character.max_speed
	else:
		owner_character.velocity.x = move_toward(owner_character.velocity.x, 0, owner_character.max_speed)
		owner_character.velocity.z = move_toward(owner_character.velocity.z, 0, owner_character.max_speed)

func check_jump(delta: float) -> void:
	if owner_character.is_on_floor() and Input.is_action_just_pressed("jump"):
		owner_character.velocity.y += owner_character.jump_velocity
