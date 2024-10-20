extends Node

@export var obstacle_scene: PackedScene
var score
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Joueur.hide()
	$Obstacle.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func game_over() -> void:
	$ScoreTimer.stop()
	$MobTimer.stop()

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	get_tree().call_group("obstacle", "queue_free")


func _on_mob_timer_timeout() -> void:
	var obstacle = obstacle_scene.instantiate()

	# Choose a random location on Path2D.
	var liste_spawn_location = [$Point_1,$Point_2,$Point_3]
	var obstacle_spawn_location=liste_spawn_location[randi() % liste_spawn_location.size()]
	obstacle.position=obstacle_spawn_location.position
	# Choose the velocity for the mob.
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)

	# Spawn the mob by adding it to the Main scene.
	add_child(obstacle)



func _on_score_timer_timeout() -> void:
	score -= 1


func _on_start_timer_timeout() -> void:
	$MobTimer.start()
	$ScoreTimer.start()
	$BeerChugTimer.start()


func _on_beer_chug_timeout() -> void:
	$BeerChug.hide()
	$Joueur.show()
	$route.show()
	$obstacle.show()
