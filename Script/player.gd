extends CharacterBody2D

@export var speed : float = 300
@export var animator : AnimatedSprite2D
@export var animator_rocket : AnimatedSprite2D
@export var hp : int
@export var bullet_A_scene : PackedScene
enum MovingStatusRL{
	flat,
	right,
	left
}
var movingStatusRL

var is_shoot_A : bool = false
var is_explode : bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	movingStatusRL = MovingStatusRL.flat
	animator.play("default")
	hp = 1
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("left","right","forward","backward") * speed
	if hp > 0:
		#left animation
		if Input.is_action_pressed("left") and movingStatusRL != MovingStatusRL.left:
			animator.play("turn_left")
			movingStatusRL = MovingStatusRL.left
		elif not Input.is_action_pressed("left")  and  movingStatusRL == MovingStatusRL.left:
			movingStatusRL = MovingStatusRL.flat
			animator.play("turn_left_B")
			
		#right animation
		if Input.is_action_pressed("right") and movingStatusRL != MovingStatusRL.right:
			animator.play("turn_right")
			movingStatusRL = MovingStatusRL.right
		elif  not Input.is_action_pressed("right")  and  movingStatusRL == MovingStatusRL.right:
			movingStatusRL = MovingStatusRL.flat
			animator.play("turn_right_B")
		
		#forward animation
		if Input.is_action_pressed("forward"):
			animator_rocket.play("move_forward")
		else :
			animator_rocket.play("default")
	elif !is_explode:
		animator.play("dead")
		is_explode = true
	
	
	
	if Input.is_action_pressed("shoot_A"):
		is_shoot_A = true
		if $Shoot_A_Timer.is_stopped():
			$Shoot_A_Timer.start()
		
		
		
		print("shoot!!")
	elif Input.is_action_just_released("shoot_A") :
		$Shoot_A_Timer.stop()
		is_shoot_A = false
		
		if $Shoot_A_Timer.is_stopped():
			print("stop")
	
	if hp >0:
		move_and_slide()
func _on_timer_timeout() -> void:
	
	fire_bullet_A()
	
	
func fire_bullet_A() -> void:
	var bullet_node = bullet_A_scene.instantiate()
	bullet_node.position = position + Vector2(0,-70)
	get_tree().current_scene.add_child(bullet_node)
	print("Shootaaaaaaa")
	$FireSound.play()
