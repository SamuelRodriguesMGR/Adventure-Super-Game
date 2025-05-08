extends Objects


@export var can_open : bool = false
@export var change_scene : String
@export var spawn_pos : Vector2

var is_open : bool = false

func _ready() -> void:
	animation_player.play(&"RESET")
	animation_player.play(&"Door/RESET")
	
func interact() -> void:
	if not can_open:
		animation_player.play(&"interact")
		return
		
	# Если открывается/закрывается, то не взаимодействовать
	if animation_player.is_playing():
		return
		
	if is_open:
		animation_player.play(&"Door/close")
	else:
		animation_player.play(&"Door/open")
		$Timer.start()
		
	is_open = not is_open


func _on_timer_timeout() -> void:
	if is_open:
		animation_player.play(&"Door/close")
		is_open = not is_open

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player" and change_scene:
		get_tree().current_scene.set_current_location(change_scene, spawn_pos)
