extends Node2D
var health: int
@export var healthLabel: Label
@export var BossSprite: Array[Texture2D]
@export var Sprite: Sprite2D

func _ready() -> void:
	health = randi_range(100, 200)
	
	if healthLabel:
		healthLabel.text = "Health:" + str(health)
	
	if BossSprite.size() > 0:
		var largestIndex = BossSprite.size() - 1
		Sprite.texture = BossSprite[randi_range(0, largestIndex)]


func _on_attack_pressed() -> void:
	if  Globals.AttackCharge > 0:
		health = health - randi_range(Globals.StreakNum, 50)
		if health <= 0:
			healthLabel.text = "You win!"
		else:
			healthLabel.text = "Health:" + str(health)
		Globals.AttackCharge = Globals.AttackCharge - 1
	pass 


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
	pass
