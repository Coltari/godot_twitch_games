extends State

func enter(_msg := {}) -> void:
	owner.takedamage()
	owner.sprite.play("default")
	owner.sprite.stop()

func update(_delta) -> void:
	if !owner.is_on_floor():
		state_machine.transition_to("Falling")
	if owner.health <= 0:
		state_machine.transition_to("Dying")

func physics_update(_delta) -> void:
	owner.velocity.x = move_toward(owner.velocity.x, 0, owner.SPEED)

func canFire(angle,thrust) -> void:
	var values : Dictionary = {"angle":angle,"thrust":thrust}
	state_machine.transition_to("Firing", values)

func canMove(dir, time) -> void:
	var values : Dictionary = {"direction":dir,"time":time}
	state_machine.transition_to("Moving", values)

func canJump() -> void:
	if owner.is_on_floor():
		owner.velocity.y = owner.JUMP_VELOCITY
