extends FiniteStateMachine


func _init() -> void:
	_add_state("idle")
	_add_state("move")
	_add_state("jump")

func _ready() -> void:
	set_state(states.idle)

func _state_logic(_delta: float) -> void:
	parent.get_input()
	parent.move()
		
func _get_transition() -> int:
	match state:
		states.idle:
			if parent.velocity.length() > 10:
				return states.move
				
		states.move:
			if parent.velocity.length() < 10:
				return states.idle
				
		states.jump:
			if not animation_player.is_playing():
				return states.move
	return -1
	
func _enter_state(_previous_state: int, new_state: int) -> void:
	match new_state:
		states.idle:
			animation_player.play("idle")
		states.move:
			animation_player.play("move")
		states.jump:
			animation_player.play("jump")
