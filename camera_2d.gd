extends Camera2D

@export var shake_decay_rate: float = 5.0 

var current_shake_strength: float = 0.0
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()


func apply_shake(strength: float = 30.0):
	current_shake_strength = strength

func _process(delta: float):
	if current_shake_strength > 0:
		current_shake_strength = lerpf(current_shake_strength, 0, shake_decay_rate * delta)
		
		offset = get_random_offset()
		
		if current_shake_strength < 0.1:
			current_shake_strength = 0.0
			offset = Vector2.ZERO

func get_random_offset() -> Vector2:
	var x = rng.randf_range(-current_shake_strength, current_shake_strength)
	var y = rng.randf_range(-current_shake_strength, current_shake_strength)
	return Vector2(x, y)
