extends KinematicBody2D

export var player_index: int = 0

var linear_vel = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	linear_vel.y += 800 * delta
	
	var target_vel = Input.get_action_strength("move_right_" + str(player_index)) - Input.get_action_strength("move_left_" + str(player_index))
	linear_vel.x = lerp(linear_vel.x, target_vel * 400, 0.1)
	
	if Input.is_action_just_pressed("move_up_" + str(player_index)):
		linear_vel.y -= 400
	
	linear_vel = move_and_slide(linear_vel)
	
	
	
#	var slide_count = get_slide_count()
#	for i in range(slide_count):
#		var collision = get_slide_collision(i)
#		var collider = collision.collider
#		if collider.is_in_group("Player"):
#			collider.linear_vel += linear_vel
#
