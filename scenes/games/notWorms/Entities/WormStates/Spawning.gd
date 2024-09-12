extends State

var spawntime: float

func enter(_msg := {}) -> void:
	spawntime = 0.0

func physics_update(delta) -> void:
	owner.velocity.y += owner.gravity * delta

func update(_delta) -> void:
	spawntime += _delta
	if spawntime > 2:
		state_machine.transition_to("Idle")
	if owner.is_on_floor():
		state_machine.transition_to("Idle")
