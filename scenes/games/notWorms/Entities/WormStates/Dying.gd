extends State

func enter(_msg := {}) -> void:
	pass

func update(_delta) -> void:
	owner.queue_free()
