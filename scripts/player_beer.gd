extends Node2D

@onready var pivot: Node2D = $Pivot
var current_rotation = 0.0
var beer_val
@onready var scores: Node = $Scores
@export var score: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Test debug beer")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed(("Chug_Beer")):
		pivot.rotation = lerp_angle(pivot.rotation, deg_to_rad(0), 5 * delta)
	else:
		pivot.rotation = lerp_angle(pivot.rotation, deg_to_rad(78), 5 * delta)
		
	beer_val = 77 - int(pivot.rotation_degrees)
	
	if Input.is_action_pressed(("score")):
		_score()

func _score() -> void:
	var score_i = score.instantiate()
	score_i.position = Vector2(randf_range(-500, 500), randf_range(-500, 500))
	var anim_player = score_i.get_node("AnimationPlayer")
	score_i.scale.y = 0.5
	score_i.scale.x = 0.5
	add_child(score_i)
	anim_player.play("score_bonus")

		
