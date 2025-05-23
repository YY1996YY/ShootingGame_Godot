extends CharacterBody2D

@export var speed : float = 300
@export var animator : AnimatedSprite2D
@export var animator_rocket : AnimatedSprite2D
@export var hp : int
enum MovingStatusRL{
	flat,
	right,
	left
}
var movingStatusRL
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	movingStatusRL = MovingStatusRL.flat
	animator.play("default")
	hp = 3
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("left","right","forward","backward") * speed
	
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
	
	
	
	move_and_slide()
