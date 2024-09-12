extends State

func enter(values := {}) -> void:
	owner.firing = true
	owner.weapon.visible = true
	owner.sprite.play("default")
	owner.sprite.stop()
	var angle = values.get("angle")
	var thrust = values.get("thrust")
	fire(angle, thrust)

func update(_delta) -> void:
	if !owner.firing:
		state_machine.transition_to("Idle")

func fire(angle, thrust) -> void:
	var r = owner.ROCKET.instantiate()
	owner.weapon.rotation = angle
	r.global_position = owner.weapon.muzzle.global_position 
	r.firingdata(angle,thrust)
	#2 seconds is 100%
	#1000 thrust is 100%
	#get thrust %
	var pc = (thrust/1000.0)
	#apply % to max time
	var t = 2*pc
	await get_tree().create_timer(t).timeout
	owner.add_rocket.emit(r)
	owner.weapon.set_progress(0)
	owner.firing = false

func exit() -> void:
	owner.weapon.visible = false
