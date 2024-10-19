extends Sprite2D

@export var speed = 400
var screen_size
@export var obstacle_scene: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	velocity.y=speed
	position += velocity * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	var obstacle = obstacle_scene.instantiate()

	# Choose a random location on Path2D.
	var liste_spawn_location = [$Point_1,$Point_2,$Point_3]
	var obstacle_spawn_location=liste_spawn_location[randi() % liste_spawn_location.size()]
	obstacle.position=obstacle_spawn_location.position
	# Choose the velocity for the mob.
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)

	# Spawn the mob by adding it to the Main scene.
	add_child(obstacle)
