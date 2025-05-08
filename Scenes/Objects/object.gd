class_name Objects extends StaticBody2D


@onready var label : Label = get_node(^"Label")
@onready var animation_player : AnimationPlayer = get_node(^"AnimationPlayer")

func interact() -> void:
	animation_player.play(&"interact")
