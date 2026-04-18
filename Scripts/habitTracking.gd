extends Node

@export var streakButton: Button
@export var streakDisplay: Label
@export var StreakNaming: Control
@export var StreakContainer: VBoxContainer
@export var AttackCharge: Button
var SceneTemplate: PackedScene = preload("res://StreakTemplate.tscn")
var currentHabitName: String
var isNameSubmitted: bool
var isNameStarted: bool
const SAVE_PATH = "user://STREAKSAVE.txt"
var time



func _ready() -> void:
	var StreakVar = DirAccess.open("user://Streaks")
	if StreakVar:
		var StreakFiles = StreakVar.get_files()
		for file_name in StreakFiles:
			if file_name.ends_with(".txt"):
					var habit_name = file_name.trim_suffix(".txt")
					print("Found saved habit: ", habit_name)
					currentHabitName = habit_name
					create_instance(SceneTemplate)
	pass


func _process(delta: float) -> void:
	streakDisplay.text = str(Globals.StreakNum)
	


func _on_create_streak_pressed() -> void:
	StreakNaming.visible = true




func _on_line_edit_text_submitted(new_text: String) -> void:
	if new_text.strip_edges() == "":
		return 
		
	currentHabitName = new_text
	StreakNaming.visible = false
	
	create_instance(SceneTemplate)



func create_instance(add):
	var scene_instance = add.instantiate()
	StreakContainer.add_child(scene_instance)
	scene_instance.setup_streak(currentHabitName)
	return scene_instance


func _on_boss_fight_pressed() -> void:
	get_tree().change_scene_to_file("res://BossFight1.tscn")
	pass # Replace with function body.


func _on_attack_charge_timeout() -> void:
	Globals.AttackCharge += 1
	AttackCharge.text = "Attack Charges:" + str(Globals.AttackCharge)
	pass
