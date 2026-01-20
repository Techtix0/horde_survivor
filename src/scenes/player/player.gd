class_name Player	
extends CharacterBody2D

@onready var animations: AnimatedSprite2D = $Animations
@onready var move_state_machine: Node = $MoveStateMachine
@onready var attack_state_machine: Node = $AttackStateMachine
@onready var move_component: Node = $PlayerMoveComponent

@export var iframe_time: float

func _ready() -> void:
	add_to_group("Player")
	move_state_machine.init(self, animations, move_component)
	attack_state_machine.init(self, animations, move_component)
	PlayerManager.link_player(self)

func _unhandled_input(event: InputEvent):
	move_state_machine.process_input(event)
	attack_state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	move_state_machine.process_physics(delta)
	attack_state_machine.process_physics(delta)

func _process(delta: float) -> void:
	move_state_machine.process_frame(delta)
	attack_state_machine.process_frame(delta)

