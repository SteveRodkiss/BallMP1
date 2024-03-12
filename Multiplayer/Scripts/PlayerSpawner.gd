extends MultiplayerSpawner

#the prefab
@export var player_prefab = preload("res://Player/Player.tscn")
@onready var spawn_node = get_node(spawn_path)


func spawn_player(id : int):
	#spawn a player at a random position
	var player = player_prefab.instantiate()
	player.name = str(id)
	var random_position = Vector3( randf_range(-5,5),5,randf_range(-5,5))
	player.position = random_position
	spawn_node.add_child(player,true)
