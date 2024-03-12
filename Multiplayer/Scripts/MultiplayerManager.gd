extends Node

#reacts to UI events and starts a server or join a server
var IP_ADDRESS = "127.0.0.1"
var PORT = 2048
var MAX_CLIENTS = 32

#the player spawner
@onready var player_spawner : MultiplayerSpawner = $PlayerSpawner
@onready var ui = $MultiplayerUI

func join_game():
	# Create client.
	var peer = ENetMultiplayerPeer.new()
	peer.create_client(IP_ADDRESS, PORT)
	multiplayer.multiplayer_peer = peer	
	ui.hide()


func create_server():
	var peer = ENetMultiplayerPeer.new()
	peer.create_server(PORT, MAX_CLIENTS)
	multiplayer.multiplayer_peer = peer
	ui.hide()
	#these are only called on the server- cos we connect them here
	multiplayer.peer_connected.connect(on_player_joined)
	multiplayer.peer_disconnected.connect(on_player_disconnected)
	
	
func on_player_joined(id:int):
	player_spawner.spawn_player(id)

func on_player_disconnected(id:int):
	#TODO- delete the player whon left. On the server delete the player
	var player = get_node_or_null(str(id))
	if player:
		player.queue_free()
