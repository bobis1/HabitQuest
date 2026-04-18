extends Control # Or whatever your root node type is

@onready var streak_button: Button = $StreakButton

var habit_name: String = ""
var local_streak: int = 0

func setup_streak(new_habit_name: String) -> void:
	habit_name = new_habit_name
	DirAccess.make_dir_recursive_absolute("user://Streaks")
	var save_path = "user://Streaks/" + habit_name + ".txt"
	
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		local_streak = file.get_as_text().to_int()
	else:
		local_streak = 0 
	update_button_visuals()

func _on_streak_button_pressed() -> void:
	local_streak += 1
	Globals.StreakNum += 1
	var save_path = "user://Streaks/" + habit_name + ".txt"
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_string(str(local_streak))
	
	update_button_visuals()

func update_button_visuals() -> void:
	streak_button.text = habit_name + " - Streak: " + str(local_streak)
