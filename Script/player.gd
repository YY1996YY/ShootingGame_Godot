extends CharacterBody2D

enum MovingStatusRL{
	flat,
	right,
	left
}
var movingStatusRL
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	movingStatusRL = MovingStatusRL.flat
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
