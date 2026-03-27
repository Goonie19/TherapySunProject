extends Node

class_name MinigameController

var minigame_time : float

@export var dialogue_manager: DialogueView

@export var sequence_timer: Timer
@export var spawn_timer: Timer
@export var meteor_spawner: MeteorSpawner
@export var sun_space_rotator_node: Node2D
@export var mini_action: MinigameAction

var character: CharacterController
var current_meteor_pos: int
var mini_sequence: MinigameSequence
var current_sequence: int

signal on_meteor_sequence_finished
signal on_minigame_finished

func set_dependencies(character_controller: CharacterController):
	character = character_controller

func start_minigame(minigameAction: MinigameAction):
	mini_sequence = minigameAction.sequences[current_sequence]
	current_meteor_pos = 0
	
	sun_space_rotator_node.process_mode = Node.PROCESS_MODE_INHERIT
	
	for n in range(0, mini_sequence.sequence.size()):
		await run_sequences_async()
	
	on_minigame_finished.emit()
	

func spawn_random_meteor():
	meteor_spawner.spawn_meteor(sun_space_rotator_node, mini_sequence.sequence[current_meteor_pos].spawn_pos)
	current_meteor_pos += 1
	
	if current_meteor_pos < mini_sequence.sequence.size():
		spawn_timer.start(mini_sequence.sequence[current_meteor_pos].time_stamp)


func run_sequences_async() -> void:
	if(mini_sequence.dialogue_at_begining != null):
		dialogue_manager.start_dialogue(mini_sequence.dialogue_at_begining)
		await dialogue_manager.on_dialogue_finished
	
	play_metor_sequence()
	await on_meteor_sequence_finished
	
	sequence_timer.start(mini_sequence.ending_waiting)
	await sequence_timer.timeout
	
	if(mini_sequence.dialogue_at_end != null):
		dialogue_manager.start_dialogue(mini_sequence.dialogue_at_end)
		await dialogue_manager.on_dialogue_finished	


func play_metor_sequence() -> void:
	spawn_timer.start(mini_sequence.sequence[current_meteor_pos].time_stamp)

func finish_minigame():
	spawn_timer.stop()
	on_meteor_sequence_finished.emit()
