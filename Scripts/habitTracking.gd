extends Node

@export var streakButton: Button
@export var streakDisplay: Label

const SAVE_PATH = "user://PLACEHOLDER.txt"

func _ready() -> void:
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		Globals.StreakNum = file.get_as_text().to_int()
	else:
		print("Streak Save file not found. Starting from 0.")
		Globals.StreakNum = 0


func _process(delta: float) -> void:
	streakDisplay.text = str(Globals.StreakNum)


func _on_button_pressed() -> void:
	Globals.StreakNum += 1
	

	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	
	file.store_string(str(Globals.StreakNum))
