extends Node

signal route
var score
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	route.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	get_tree().call_group("obstacle", "queue_free")

func _on_score_timer_timeout() -> void:
	score -= 1


func _on_start_timer_timeout() -> void:
	$MobTimer.start()
	$ScoreTimer.start()
	$BeerChugTimer.start()


func _on_beer_chug_timeout() -> void:
	get_tree().call_group("Beer", "hide")
	$Joueur.show()
	$route.show()
	$obstacle.show()
