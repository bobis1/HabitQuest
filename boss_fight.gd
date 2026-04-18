extends Node2D
var health: int
@export var healthLabel: Label
@export var BossSprite: Array[Texture2D]
@export var Sprite: Sprite2D

func _ready() -> void:
#	BossSprite.resize(3)
	health = randi_range(100, 200)
	healthLabel.text = "Health:" + str(health)
	Sprite.texture = BossSprite[randi_range(0, BossSprite.size()-1)]
	print("Boss Sprite ", str(BossSprite.size()))
	pass



func _on_attack_pressed() -> void:
	if  Globals.AttackCharge > 0:
		health = health - randi_range(Globals.StreakNum, 50)
		if health <= 0:
			healthLabel.text = "You win!"
		else:
			healthLabel.text = "Health:" + str(health)
	pass 


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
	pass
