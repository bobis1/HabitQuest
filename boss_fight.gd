extends Node2D
var health: int
@export var healthLabel: Label
@export var BossSprite: Array[Texture2D]
@export var Sprite: Sprite2D
@export var Texture1: Texture2D
@export var AttackCounter: Label
@export var particleSystem: GPUParticles2D
@export var ParticleTimer: Timer
@export var Camera: Camera2D
@export var defeatParticles: GPUParticles2D
func _ready() -> void:
	health = randi_range(100, 200)
	if healthLabel:
		healthLabel.text = "Health:" + str(health)
	AttackCounter.text = "Attack Counter: " + str(Globals.AttackCharge)
	Sprite.texture = BossSprite[randi_range(0, BossSprite.size()-1)]

func _on_attack_pressed() -> void:
	if  Globals.AttackCharge > 0:
		health = health - Globals.StreakNum
		if health <= 0:
			particleSystem.visible = True
			ParticleTimer.start()
			await get_tree().create_timer(1.0).timeout
			healthLabel.text = "You win!!!"
			Sprite.visible = false
		else:
			healthLabel.text = "Health:" + str(health)
		Globals.AttackCharge = Globals.AttackCharge - 1
		particleSystem.visible = true
		ParticleTimer.start()
		Camera.apply_shake(40)
		AttackCounter.text = "Attack Counter: " + str(Globals.AttackCharge)
	pass 


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
	pass


func _on_particle_timer_timeout() -> void:
	particleSystem.visible = false
	pass
