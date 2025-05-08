class_name Character extends CharacterBody2D


const FRICTION : float = 0.15

@export var acceleration : int = 5 # ускорение
@export var max_speed    : int = 40 
@onready var sprite   : AnimatedSprite2D = get_node(^"AnimatedSprite2D")
@onready var state_machine: FiniteStateMachine = get_node(^"FiniteStateMachine")

var move_direction : Vector2

func _physics_process(_delta: float) -> void:
	move_and_slide()
	velocity = lerp(velocity, Vector2.ZERO, FRICTION) 
	
func move() -> void:
	velocity += move_direction * acceleration
	velocity = velocity.limit_length(max_speed)
