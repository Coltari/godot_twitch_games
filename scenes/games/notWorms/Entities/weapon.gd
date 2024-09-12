extends AnimatedSprite2D

@onready var muzzle = $Muzzle
@onready var texture_progress_bar = $TextureProgressBar

func set_progress(value) -> void:
	texture_progress_bar.value = value

func update_progress(value) -> void:
	texture_progress_bar.value += value
