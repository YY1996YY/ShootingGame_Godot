extends Area2D
@export var animator : AnimatedSprite2D

@export var enemy01_speed : float

var is_explored : bool
var isOn : bool = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position += Vector2(0,enemy01_speed) * delta
	
	


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D && !is_explored:
		animator.play("explode")
		is_explored = true
		body.hp -= 1
		print(body.hp)
		$DestroyTimer.start()
		
	


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("playerBullet") && !is_explored:
		animator.play("explode")
		is_explored = true
		$DestroyTimer.start()


func _destroy_timer_timeout() -> void:
	queue_free()
