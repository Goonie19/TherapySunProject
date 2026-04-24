extends Node

class_name MinigameController

var minigame_time : float

@export var dialogue_manager: DialogueView

@export var end_sequence_timer: Timer
@export var spawn_timer: Timer
@export var meteor_spawner: MeteorSpawner
@export var sun_space_rotator_node: Node2D

var character: CharacterController
var current_meteor_pos: int
var mini_sequence: MinigameSequence
var current_sequence: int

signal on_meteor_sequence_finished
signal on_minigame_finished

func set_dependencies(character_controller: CharacterController, dialogue_manager: DialogueView):
	character = character_controller
	self.dialogue_manager = dialogue_manager

func start_minigame(minigameAction: MinigameAction):
	mini_sequence = minigameAction.sequences[current_sequence]
	
	sun_space_rotator_node.process_mode = Node.PROCESS_MODE_INHERIT
	
	for n in range(0, minigameAction.sequences.size()):
		mini_sequence = minigameAction.sequences[current_sequence]
		current_meteor_pos = 0
		await run_current_sequence_async()
		current_sequence = current_sequence + 1
	
	on_minigame_finished.emit()
	

func spawn_random_meteor():
	meteor_spawner.spawn_meteor(sun_space_rotator_node, mini_sequence.sequence[current_meteor_pos].spawn_pos)
	current_meteor_pos += 1
	
	if current_meteor_pos < mini_sequence.sequence.size():
		spawn_timer.start(mini_sequence.sequence[current_meteor_pos].time_stamp)
	else:
		finish_spawn_sequence()


func run_current_sequence_async() -> void:
	if(mini_sequence.dialogue_at_begining != null):
		dialogue_manager.start_dialogue(mini_sequence.dialogue_at_begining)
		await dialogue_manager.on_dialogue_finished
	
	play_metor_sequence()
	await on_meteor_sequence_finished
	
	if(mini_sequence.dialogue_at_end != null):
		dialogue_manager.start_dialogue(mini_sequence.dialogue_at_end)
		await dialogue_manager.on_dialogue_finished	


func play_metor_sequence() -> void:
	spawn_timer.start(mini_sequence.sequence[current_meteor_pos].time_stamp)

func finish_spawn_sequence():
	spawn_timer.stop()
	end_sequence_timer.start(mini_sequence.ending_wait_time)
	await end_sequence_timer.timeout
	on_meteor_sequence_finished.emit()
