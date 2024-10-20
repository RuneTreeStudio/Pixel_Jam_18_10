extends Node2D

@onready var player: Node2D = %Player
@onready var drunk_bar: TextureProgressBar = $TextureProgressBar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if player.beer_val > 10:
		drunk_bar.value += 0.3	
	else:
		drunk_bar.value -= 0.2	
		
	print("beer val: ", player.beer_val)
	print("%: ", drunk_bar.value)
	
