extends Node2D

@export var background_scene : Array[PackedScene]
@export var background_node : Array
@export var enemy2_scene : PackedScene
@export var enemyBoss_scene : PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#DisplayServer.window_set_title("2025年度＿制作実習＿シューティングゲーム＿「楊屹凡」")]
	get_window().title = "2025年度＿制作実習＿シューティングゲーム＿「楊屹凡」"
		# Background
	for i in 8:
		background_node[i] =  background_scene[i].instantiate()
		background_node[i].position = Vector2(0,i*180)
		get_tree().current_scene.add_child(background_node[i])
		# Background


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:

		# Background
	for i in 8:
		background_node[i].position += Vector2(0,10)
		if background_node[i].position.y>7*180:
			background_node[i].position = Vector2(0,-170);
		# Background
		
		
	#esc
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
		


func _on_e_2_timer_timeout() -> void:
	var enemy2_node = enemy2_scene.instantiate();
	enemy2_node.position = Vector2(randf_range(150,550),-100)
	get_tree().current_scene.add_child(enemy2_node)
	
	


func _boss1_timer_timeout() -> void:
	var enemyBoss_node = enemyBoss_scene.instantiate();
	enemyBoss_node.position = Vector2(randf_range(150,550),-200)
	get_tree().current_scene.add_child(enemyBoss_node)
