class_name Global

#存放游戏标签枚举
enum GameTag
{
	NULL = 0,
	
	EVENT_ATTACK = 6,
	
	INPUT_MOVE = 1,
	INPUT_JUMP = 2,
	
	INPUT_DASH = 3,
	
	STATE_RECOVERY = 64,
	STATE_LOCOMOTION = 65,
	STATE_JUMP = 66,
	STATE_DASH = 67,
	STATE_LIGHTATTACK = 68,
	
	
	ABILITY_HURT = 128,
	ABILITY_MOVE = 129,
	ABILITY_JUMP = 131,
	ABILITY_LIGHTATTACK = 132,
	ABILITY_DASH = 133,
	
	ABILITY_SPECIAL_FIRST = 134,
	ABILITY_SPECIAL_SECOND = 135,
}


#存放标签和对应的字符串的字典
static var TagStringDic : Dictionary = {
	"Null":GameTag.NULL,
	
	"Input_Move":GameTag.INPUT_MOVE ,
	"Input_Jump" : GameTag.INPUT_JUMP ,
	
	"Event_Attack":GameTag.EVENT_ATTACK,
	
	"Ability_LightAttack" :GameTag.ABILITY_LIGHTATTACK ,
	
}
