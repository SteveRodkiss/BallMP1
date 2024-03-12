extends MultiplayerSpawner

#the prefab- make sure it is added to the spawn list of this multiplayer spawner node
@export var player_prefab : PackedScene
#part of the multiplayerspawner node
@onready var spawn_node = get_node(spawn_path)

func _ready() -> void:
	#add the player prefab to the list of spawnable scenes
	add_spawnable_scene(player_prefab.resource_path)


func spawn_player(id : int):
	print(player_prefab.resource_path)
	#spawn a player at a random position
	print(multiplayer.get_unique_id(), " called spawn player.")
	var player = player_prefab.instantiate()
	player.name = str(id)
	var random_position = Vector3( randf_range(-5,5),5,randf_range(-5,5))
	player.position = random_position
	#spawn on the correct node as pointed to by the multiplayer spawner
	spawn_node.add_child(player,true)
