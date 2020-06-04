extends Line2D

export var player_path: NodePath
onready var player = get_node(player_path)
export var player2_path: NodePath
onready var player2 = get_node(player2_path)

var max_dist = 200


# Called when the node enters the scene tree for the first time.
func _ready():
	points = PoolVector2Array([player.global_position, player2.global_position])

func _physics_process(delta):
	points[0] = player.global_position
	points[1] = player2.global_position
	
	var current_lenght = (points[0] - points[1]).length()
	
	width = (max_dist - current_lenght) / max_dist * 10 + 10
	
	if current_lenght > max_dist:
	
		var delt = points[0] - points[1]
		var target = delt.length()
		var diff = (target - max_dist)/target
		
		var plv = player.linear_vel.length()
		var p2lv = player2.linear_vel.length()
		
		var tlv = plv + p2lv
		
		player2.linear_vel += delt * (plv / tlv) * diff
		player.linear_vel -= delt * (p2lv / tlv) * diff
	
	
