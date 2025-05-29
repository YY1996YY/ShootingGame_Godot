extends  Area2D

@export var animator : AnimatedSprite2D
@export var enemyBoss_speed : float
@export var hp : int
@export var enemy1_scene : PackedScene
var is_explored : bool = false
const  isOn : bool = true
var canATK : bool = false
var atkLast : int = 3
var atkDelta : float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	#move
	if position.y < 200:
		position += Vector2(0,enemyBoss_speed) * delta
	elif position.x < get_parent().get_node("Player").position.x:
		position.x+=100 * delta
		pass
	elif  position.x > get_parent().get_node("Player").position.x:
		position.x-=100 * delta
		pass
	
	#attack control
	atkDelta +=delta
	if canATK:
		atkDelta +=delta
		if atkLast > 0 && atkDelta >= 0.3:
			var enemy1_node = enemy1_scene.instantiate();
			enemy1_node.position = position
			get_tree().current_scene.add_child(enemy1_node)
			atkLast-=1
			atkDelta =0
	
	
	
	


func _onarea_entered(area: Area2D) -> void:
	if area.is_in_group("playerBullet") && !is_explored:
		hp=hp-1
		print("1111111111111111111111")
	if hp <=0:
		animator.play("explode")
		is_explored = true
		$DestroyTimer.start()
		
func _on_destroy_timer_timeout() -> void:
	queue_free()


func _on_atk_timer_timeout() -> void:
	canATK = true
	atkLast = 3
		
	
	pass # Replace with function body.
