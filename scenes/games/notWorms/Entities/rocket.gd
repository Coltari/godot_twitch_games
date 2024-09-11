extends RigidBody2D

const EXPLODE = preload("res://scenes/games/notWorms/Entities/explode.tscn")

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var collision_shape_2d = $CollisionShape2D
@onready var area_2d = $Area2D

var wind : Vector2 = Vector2.ZERO
signal add_explosion(explosion)

func firingdata(angle, impulse):
	#rotation_degrees = angle
	apply_central_impulse(Vector2(0,impulse).rotated(angle))

func _on_area_2d_body_entered(_body):
	#explode
	var e = EXPLODE.instantiate()
	e.position = self.position
	add_explosion.emit(e)
	queue_free()

func update_wind(newValue):
	wind = newValue

func _physics_process(_delta):
	apply_central_force(wind*100)

func _process(_delta):
	var moverotation = atan2(linear_velocity.y,linear_velocity.x) + PI /2
	animated_sprite_2d.rotation = moverotation
	collision_shape_2d.rotation = moverotation
	area_2d.rotation = moverotation
	#rotation = atan2(linear_velocity.y,linear_velocity.x) + PI /2
	pass
