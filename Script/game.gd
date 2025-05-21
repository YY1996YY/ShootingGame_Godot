extends Node2D

@export var background_scene : Array[PackedScene]
@export var background_node : Array
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
		# Background
	for i in 8:
		background_node[i] =  background_scene[i].instantiate()
		background_node[i].position = Vector2(0,i*180)
		get_tree().current_scene.add_child(background_node[i])
		# Background


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

		# Background
	for i in 8:
		background_node[i].position += Vector2(0,1)
		if background_node[i].position.y>7*180:
			background_node[i].position = Vector2(0,-179);
		# Background
