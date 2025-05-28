extends Area2D

@export var bullet_speed : float = -100
@export var animator : AnimatedSprite2D

var isOn : bool = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += Vector2(0,bullet_speed)*delta;


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy") && area.isOn: 
		#area.isOn = false
		bullet_speed = 0
		animator.play("hit")
		print("hit")
		$DestroyTimer.start()
		#get_tree().create_timer(0.6)
		#queue_free()


func _destroy_timer_timeout() -> void:
	
	queue_free()
